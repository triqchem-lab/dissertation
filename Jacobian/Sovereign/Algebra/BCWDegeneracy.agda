{-# OPTIONS --rewriting --guardedness #-}

-- | Sovereign.Algebra.BCWDegeneracy
-- 定理二: BCW 矩阵代数的离散离心定理
--
-- 在 GF(3) 上, BCW 幂零规约 J(H) 存在局部退化族:
--   y³ ≡ y (Fermat 坍缩) → ∂(y³)/∂y = 0 (形式导数盲区)
--   连续切空间的局部微元矩阵无法作为离散双射的单射流判据.
--
-- 否决性定理 (No-Go): 经典 JC 的"局部→全局"范式在离散空间必然失效.
-- 完整证明在 jac_GF3.agda 和 jac_FrobeniusBlind.agda (0 postulate).

module Sovereign.Algebra.BCWDegeneracy where

open import Sovereign.Base.Trit using (T₀; T₁)
open import Sovereign.Algebra.Jacobian.jac_Matrix using (det2)
open import Sovereign.Algebra.Jacobian.jac_GF3
  using (F-gf3; gf3-collision; det-J-formal; J-formal)

-- Fermat 坍缩: y³=y 在 GF(3) 函数空间上
fermat-cubic : ∀ y → ((y ⊗ y) ⊗ y) ≡ y
fermat-cubic T₀ = refl
fermat-cubic T₁ = refl
fermat-cubic T₂ = refl
  where open import Sovereign.Base.Trit using (_⊗_)
        open import Relation.Binary.PropositionalEquality using (_≡_; refl)

-- BCW 离心定理: det J = 1 处处成立, 但 F 非单射
BCW-Decoupling : Set₁
BCW-Decoupling = (∀ p → det2 (J-formal p) ≡ T₁) × (F-gf3 (T₀ , T₀) ≡ F-gf3 (T₀ , T₁))

proof : BCW-Decoupling
proof = det-J-formal , gf3-collision
