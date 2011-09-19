> module Data.Cofunctor (
>     Cofunctor(..)
> ) where
>
> {- |
> The Confunctor class is useful for \"sink-like\" types, especially when
> combined with GADTs. For instance:
>
> > {-# LANGUAGE GADTs #-}
> > data StringStack a where
> >     StringStack :: (a -> String) -> [String] -> StringStack a
> >
> > emptyStack :: StringStack String
> > emptyStack = StringStack id []
> >
> > push :: a -> StringStack a -> StringStack a
> > push a (StringStack f ss) = StringStack f (f s : ss)
> >
> > instance Confunctor StringStack where
> >     cofmap f (StringStack g ss) = StringStack (g . f) ss
>
> See the "split-chan" package for another example.
> -}

Hopefully we'll have some more interesting supporting functions, classes and
instances here that will make this more useful and perhaps express some
relations with Functors.

> -- | A class for contravariant functors
> class Cofunctor f where
>     cofmap :: (b -> a) -> f a -> f b

To Consider:
    - lift product type from Data.Functor.Product to sum type (Either)
    - make instance for wrapped Category with flipped vars
    - ...
