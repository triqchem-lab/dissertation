# 离散雅可比理论 — 独立发布包

## 文件结构

```
Sovereign/
├── Algebra/
│   ├── Duodecimal.agda              CRT 正交分解 Z/12Z ≅ Z/3Z × Z/4Z
│   └── Jacobian/
│       ├── jac_GF3.agda             GF(3)² 形式导数 + 差分算子 反例
│       ├── jac_Discrete.agda        三种"雅可比"的区分
│       ├── jac_FrobeniusBlind.agda  GF(9)² Frobenius 盲区 + 81点验证
│       ├── jac_Pigeonhole.agda      鸽巢原理 Fin 9→8 (REWRITE decode9)
│       ├── jac_Matrix.agda          GF(3) 2×2 矩阵全理论 (7215行)
│       ├── jac_Injectivity.agda     单射↔满射 (右逆+鸽巢)
│       ├── jac_FunctionTable.agda   函数表矩阵: det≠0 ⟺ 双射
│       ├── jac_NMatrix.agda         9×9 函数表构造 (toTrit)
│       ├── jac_Conjecture.agda      离散 JC 陈述 + 实质定理
│       ├── jac_DiscreteJC.agda      三层综合 + 连续统 JC 关系
│       ├── jac_CRTSpectrum.agda     CRT 四极 × 矩阵谱
│       ├── jac_4320DClosure.agda    729 点鸽巢推广 + 环面有界性
│       ├── jac_EscapeAnalysis.agda  射影几何逃逸分析 (Alpöge 阻断)
│       ├── jac_Algorithm.agda       算法规格
│       └── jac_Theorem.agda         最终定理
├── Base/
│   └── Trit.agda                    GF(3) Trit 类型 + 运算
└── Structology/
    ├── T6.agda                       T⁶ = GF(3)⁶ (729格点, Fin 729 双射)
    └── A4Group.agda                 A₄ 群 (12元置换群)
```

## 编译要求

- Agda 2.9.0+
- standard-library 2.4
- `--rewriting --guardedness`

## 编译

```bash
agda Sovereign/Algebra/Jacobian/jac_Theorem.agda
```

## 核心结论

**有限集上, 全局函数表矩阵 det(M_F) ≠ 0 ⟺ F 双射 (0 postulate)**

三层雅可比强度:
```
形式导数 det J (最弱, Frobenius 盲区)
  < 差分算子 det J_Δ (无盲区, 局部条件)
    < 函数表矩阵 det(M_F) (全局, 鸽巢完备)
```

## 依赖

仅依赖 Agda 标准库 (stdlib 2.4) — 零外部依赖。

## 行数统计

- Jacobian 15 模块: ~10000 行
- Base/Trit: ~200 行
- Structology/T6 + A4Group: ~2200 行
- Algebra/Duodecimal: ~600 行
- 合计: ~13000 行
