baremodule AlgebraicNonParam

#must import operators since baremodule doesnt (AND that is the intention)
import Base.+
import Base.*
import Base.-
import Base./



abstract Algebraic

abstract Binop     <: Algebraic
abstract Semigroup <: Binop
abstract Monoid <: Semigroup
abstract Group <: Monoid


abstract BinopAdditive     <: Binop
abstract SemigroupAdditive <: Semigroup
abstract MonoidAdditive <: Monoid
abstract GroupAdditive <: Group

abstract BinopMultipicative     <: Binop
abstract SemigroupMultipicative <: Semigroup
abstract MonoidMultipicative <: Monoid
abstract GroupMultipicative <: Group

#all these works sinnce additive and multipicative for super classes interoperate
#abstract FieldAbs <: GroupAdditive,GroupMultipicative
#abstract FieldAbs <: GroupAdditive
abstract FieldAbs <: GroupMultipicative
#abstract FieldAbs






type Binopa <: BinopAdditive
v
end

type Binopm <: BinopMultipicative
v
end


#+(a::Binopa, b::Binopa)=Binopa(a.v+b.v)
+(a::Binop, b::Binop)=Binopa(a.v+b.v)
*(a::Binop, b::Binop)=Binopm(a.v*b.v)


type Semigroupa <: SemigroupAdditive
v
end

type Semigroupm <: SemigroupMultipicative
v
end

 +(a::Semigroup, b::Semigroup)=Semigroupa(a.v+b.v)
 *(a::Semigroup, b::Semigroup)=Semigroupm(a.v*b.v)


type Monoida <:  MonoidAdditive
zero
v
end

type  Monoidm <:  MonoidMultipicative
unit
v
end

getId(a::Monoida)=a.zero
getId(a::Monoidm)=a.unit


 +(a:: Monoid, b:: Monoid)=Monoida(getId(a),a.v+b.v)
 *(a:: Monoid, b:: Monoid)= Monoidm(getId(a),a.v*b.v)

 

type Groupa <:  GroupAdditive
zero
v
end

type  Groupm <:  GroupMultipicative
unit
v
end

getId(a::Groupa)=a.zero
getId(a::Groupm)=a.unit

 +(a:: Group, b:: Group)=Groupa(getId(a),a.v+b.v)
 *(a:: Group, b:: Group)= Groupm(getId(a),a.v*b.v)
 
 -(a:: Group, b:: Group)=Groupa(getId(a),a.v-b.v)
 -(a:: Group)=Groupa(getId(a),-a.v)

 /(a:: Group, b:: Group)= Groupm(getId(a),a.v/b.v)
 /(a:: Group)= Groupm(getId(a),getId(a)/a.v)


type  Field <:  FieldAbs
#need additive and multiplicative, 0 and 1
zero
unit
v
end
 
getZero(a::Field)=a.zero
getUnit(a::Field)=a.unit

 
 +(a:: FieldAbs, b:: FieldAbs)=Field(getZero(a),getUnit(a),a.v+b.v)
 *(a:: FieldAbs, b:: FieldAbs)= Field(getZero(a),getUnit(a),a.v*b.v)
 
 -(a:: FieldAbs, b:: FieldAbs)=Field(getZero(a),getUnit(a),a.v-b.v)
 -(a:: FieldAbs)=Field(getZero(a),getUnit(a),-a.v)

 /(a:: FieldAbs, b:: FieldAbs)= Field(getZero(a),getUnit(a),a.v/b.v)
 /(a:: FieldAbs)= Field(getZero(a),getUnit(a)/a.v)

 
export 
Binopa,
Binopm,
Semigroupa,
Semigroupm,
Monoida,
Monoidm,
Groupa,
Groupm,
Field,
getZero,
getUnit,
getId,
+,
*,
-,
/






end







