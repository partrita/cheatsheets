#import "./templates/conf.typ": *

#show: template.with(
  title: "Seurat 치트시트",
  header: [#datetime.today().display()],
  footer: "Single-cell RNA-seq 분석 도구",
)

= 1. 표준 분석 워크플로우

```r
library(Seurat)
pbmc <- LoadData('pbmc3k')

pbmc <- NormalizeData(pbmc) # 정규화
pbmc <- FindVariableFeatures(pbmc) # 고변동 유전자 탐색
pbmc <- ScaleData(pbmc) # 스케일링
pbmc <- RunPCA(pbmc) # PCA 실행
pbmc <- FindNeighbors(pbmc, dims = 1:30) # 이웃 탐색
pbmc <- FindClusters(pbmc) # 클러스터링
pbmc <- RunUMAP(pbmc, dims = 1:30) # UMAP 실행
DimPlot(pbmc, reduction = 'umap') # 시각화
```

= 2. 데이터 접근 및 제어

- 셀/특징 이름: `Cells(obj)`, `Features(obj)`
- 메타데이터: `obj[[]]`, `obj$column`
- 아이덴티티 설정: `Idents(obj) <- 'column'`
- 발현 데이터 (v5): `obj[["RNA"]]$counts`
- 차원 축소 결과: `Embeddings(obj, 'pca')`, `Loadings(obj, 'pca')`

= 3. 부분 집합 및 병합

- 부분 집합화: `subset(obj, idents = 'B')`, `subset(obj, MS4A1 > 2.5)`
- 레이어 분할/통합: `split(obj[["RNA"]], f = obj$stim)`, `JoinLayers(obj)`
- 객체 병합: `merge(obj1, y = c(obj2, obj3))`

= 4. 데이터 시각화 (ggplot2 기반)

- `DimPlot()`: 차원 축소 결과 출력 (Cluster 등)
- `FeaturePlot()`: 특정 유전자 발현 시각화
- `VlnPlot()`: 바이올린 플롯 (발현 분포 확인)
- `DotPlot()`: 점 그래프 (클러스터별 발현율/강도)
- `DoHeatmap()`: 히트맵 출력

= 5. 다중 어세이 (Multimodal)

- 어세이 목록 확인: `Assays(obj)`
- 기본 어세이 설정: `DefaultAssay(obj) <- 'ADT'`
- 특정 어세이 데이터 접근: `obj[["ADT"]]`


