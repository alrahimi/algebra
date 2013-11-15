baremodule algebraic

#must import operators since baremodule doesnt (AND that is the intention)
import Base.+
import Base.*
import Base.-
import Base./



abstract Algebraic {T}

abstract Binop {T}     <: Algebraic {T}
abstract Semigroup {T} <: Binop {T}
abstract Monoid {T} <: Semigroup {T}
abstract Group {T} <: Monoid {T}


abstract BinopAdditive {T}     <: Binop {T}
abstract SemigroupAdditive {T} <: Semigroup {T}
abstract MonoidAdditive {T} <: Monoid {T}
abstract GroupAdditive {T} <: Group {T}

abstract BinopMultipicative {T}     <: Binop {T}
abstract SemigroupMultipicative {T} <: Semigroup {T}
abstract MonoidMultipicative {T} <: Monoid {T}
abstract GroupMultipicative {T} <: Group {T}

#doesnt work
#abstract GroupAddMul{T}  <: Union(GroupAdditive{T},GroupMultipicative{T} )
# abstract FieldAbs {T} <: GroupAddMul {T}

#abstract FieldAbs {T} <: GroupAdditive {T}

#abstract FieldAbs {T} <: GroupMultipicative {T}
#abstract FieldAbs {T}

# doesn't work verified
# julia> subtypes(GroupMultipicative)
# 1-element Array{Any,1}:
 # Groupm{T}
abstract FieldAbs {T} <: GroupAdditive {T},GroupMultipicative {T}



type Binopa {T} <: BinopAdditive {T}
v::T
end

type Binopm {T}<: BinopMultipicative {T}
v::T
end


#+(a::Binopa, b::Binopa)=Binopa(a.v+b.v)
# +(a::Binop {T}, b::Binop {T})=Binopa{T}(a.v+b.v)
# *(a::Binop {T}, b::Binop {T})=Binopm{T}(a.v*b.v)

+(a::Binop , b::Binop )=Binopa(a.v+b.v)
*(a::Binop , b::Binop )=Binopm(a.v*b.v)

#like adding an integer n times m+m+m=3*m
*(n::Integer , a::Binop )=Binopa(n*a.v)
#multiplying an element by itself  n times
^( a::Binop,n::Integer )=Binopm(a.v^n)



type Semigroupa{T} <: SemigroupAdditive {T}
v::T
end

type Semigroupm{T} <: SemigroupMultipicative {T}
v::T
end

 +(a::Semigroup , b::Semigroup )=Semigroupa(a.v+b.v)
 *(a::Semigroup , b::Semigroup )=Semigroupm(a.v*b.v)


type Monoida{T} <:  MonoidAdditive {T}
zero::T
v::T
end

type  Monoidm{T} <:  MonoidMultipicative {T}
unit::T
v::T
end

getId(a::Monoida)=a.zero
getId(a::Monoidm)=a.unit


 +(a:: Monoid , b:: Monoid )=Monoida(getId(a),a.v+b.v)
 *(a:: Monoid , b:: Monoid )= Monoidm(getId(a),a.v*b.v)

 

type Groupa{T} <:  GroupAdditive {T}
zero::T
v::T
end

type  Groupm{T} <:  GroupMultipicative {T}
unit::T
v::T
end

getId(a::Groupa)=a.zero
getId(a::Groupm)=a.unit

 +(a:: Group , b:: Group )=Groupa(getId(a),a.v+b.v)
 *(a:: Group , b:: Group )= Groupm(getId(a),a.v*b.v)
 
 -(a:: Group , b:: Group )=Groupa(getId(a),a.v-b.v)
 -(a:: Group )=Groupa(getId(a),-a.v)

 #/(a:: Group , b:: Group )= Groupm(getId(a),a.v/b.v)
 /(a:: Group , b:: Group )= Groupm(a.unit,a.v/b.v)

 #/(a:: Group )= Groupm(getId(a),getId(a)/a.v)
 /(a:: Group )= Groupm(a.unit,a.unit/a.v)



type  Field{T} <:  FieldAbs {T}
#need additive and multiplicative, 0 and 1
zero::T
unit::T
v::T
end
 
getZero(a::Field)=a.zero
getUnit(a::Field)=a.unit

 
 +(a:: FieldAbs , b:: FieldAbs )=Field(getZero(a),getUnit(a),a.v+b.v)
 *(a:: FieldAbs , b:: FieldAbs )= Field(getZero(a),getUnit(a),a.v*b.v)
 
 -(a:: FieldAbs , b:: FieldAbs )=Field(getZero(a),getUnit(a),a.v-b.v)
 -(a:: FieldAbs )=Field(getZero(a),getUnit(a),-a.v)

 /(a:: FieldAbs , b:: FieldAbs )= Field(getZero(a),getUnit(a),a.v/b.v)
 /(a:: FieldAbs )= Field(getZero(a),getUnit(a)/a.v)

 
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







