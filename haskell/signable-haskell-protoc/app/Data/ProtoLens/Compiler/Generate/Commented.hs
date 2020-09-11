-- | Enables pretty-printing Haddock comments along with top-level declarations.
module Data.ProtoLens.Compiler.Generate.Commented where

import Data.Maybe (fromMaybe)
import GHC (ModuleName)
import GHC.SourceGen
import HsSyn (hsmodName)
import Outputable (($+$), (<+>), Outputable (..), SDoc, empty, text, vcat)
import SrcLoc (unLoc)

-- | A declaration, along with an optional comment.
--
-- GHC's pretty-printer omits the contents of comments, so we can't use it here.
data CommentedDecl = CommentedDecl (Maybe SDoc) HsDecl'

instance Outputable CommentedDecl where
  ppr (CommentedDecl maybeComment decl) =
    maybe empty pprComment maybeComment
      $+$ ppr decl
    where
      pprComment c = text "{- |" <+> c <+> text "-}"

uncommented :: HsDecl' -> CommentedDecl
uncommented = CommentedDecl Nothing

commented :: SDoc -> HsDecl' -> CommentedDecl
commented = CommentedDecl . Just

data CommentedModule
  = CommentedModule
      { pragmaComments :: [String],
        moduleHeader :: HsModule',
        commentedDecls :: [CommentedDecl]
      }

getModuleName :: CommentedModule -> ModuleName
getModuleName m =
  fromMaybe (error $ "getModuleName: No explicit name")
    $ fmap unLoc
    $ hsmodName
    $ moduleHeader m

instance Outputable CommentedModule where
  ppr m =
    vcat (map text $ pragmaComments m)
      $+$ ppr (moduleHeader m)
      $+$ vcat (map ppr $ commentedDecls m)

languagePragma, optionsGhcPragma :: String -> String
languagePragma s = "{-# LANGUAGE " ++ s ++ "#-}"
optionsGhcPragma s = "{-# OPTIONS_GHC " ++ s ++ "#-}"
