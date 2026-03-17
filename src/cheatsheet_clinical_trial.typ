#import "./templates/conf.typ": *

#show: template.with(
  title: "임상시험 용어 치트시트",
  header: [#datetime.today().display()],
  footer: "*주의: 위의 내용에 오류가 있을 수도 있음",
)

#show table: set text(size: 7pt)
#set table(stroke: 0.3pt)

= 자주 쓰이는 약어
- AE (Adverse Event, 이상사례): 임상시험용 의약품 투여 후 발생한 모든 바람직하지 않은 증상이나 질환. 약물과의 인과관계 여부와 상관없이 발생한 모든 사건을 포함함.
- DLT (Dose-Limiting Toxicity, 용량 제한 독성): 투여 후 발생하는 심각한 부작용으로 인해, 그 이상의 용량 증량이 불가능하다고 판단되는 독성 수준. MTD 결정의 직접적인 기준이 됨.
- FIH (First In Human):사람을 대상으로 하는 최초 임상시험(보통 1상 초기)을 의미. 
- MAD (Multiple Ascending Dose, 다중 용량 상승 시험): 약물을 여러 번 반복 투여하며 용량을 높여가는 시험. 체내 약물 축적 및 정강상태(Steady-state)에서의 독성을 평가함.
- MTD (Maximum Tolerated Dose, 최대 내약 용량): DLT가 허용 범위를 넘지 않으면서 투여할 수 있는 가장 높은 용량. 즉, '안전한 최대치'를 의미함.
- RDE (Recommended Dose for Expansion): 용량 증량 단계 종료 후, 특정 환자군을 대상으로 더 넓게 시험하기 위해 선정된 추천 용량. 보통 MTD와 동일하거나 그 이하에서 결정됨.
- RP2D (Recommended Phase 2 Dose, 2상 권장 용량): 1상(용량 탐색) 시험 결과를 분석하여 안전성과 유효성이 가장 균형 잡혔다고 판단된, 차기 2상 시험용 최적 용량.
- SAD (Single Ascending Dose, 단일 용량 상승 시험): 코호트별로 약물을 한 번만 투여하며 용량을 단계적으로 높여 안전성과 내약성을 평가하는 기초 단계 시험.
- TTR (Time To Response, 반응 도달 시간): 치료 시작부터 객관적인 종양 반응(PR 또는 CR)이 처음 관찰될 때까지 걸린 시간.
- Q3W (Every 3 Weeks): 3주(21일) 간격의 약물 투여 주기.

= 피험자 집단 (analysis set)
분석 목적에 따라 ITT, FAS, PPS, EAS, SS로 나눔.

- ITT (Intention-To-Treat): 무작위 배정된 모든 피험자를 최초 치료군대로 분석하는 기본 원칙. 완벽 적용은 추적 어려움으로 FAS로 대체.
- FAS (Full Analysis Set): ITT에 가까운 집단으로, 최소 정당한 제외 사유(투여 미실시, 데이터 없음 등)만 제거.
- PPS (Per Protocol Set, PP): 프로토콜 완전 준수, 치료 완료, 데이터 완전한 피험자만 포함. EAS보다 엄격.
- EAS (Efficacy Analysis Set): 유효성 평가를 위한 사전 기준 충족 피험자 집단.
- SS (Safety Analysis Set): 시험약 1회 이상 투여받은 모든 피험자. 안전성(부작용) 분석용.

= RECIST 1.1
Response Evaluation Criteria In Solid Tumors(고형암 반응 평가 기준). 종양의 크기 변화를 측정하여 항암제 효과를 객관적으로 평가함.

== 반응 평가 (Response Evaluation)
- Target lesions (표적 병변): 치료 효과 평가를 위해 베이스라인에서 선정된 측정 가능한 병변. 병변 장경(Longest diameter)의 합을 추적 관리함. (최대 5개, 한 장기당 2개까지 선정)
- CR (Complete Response, 완전 관해): 모든 표적 병변이 사라지고, 림프절 전이가 있었던 경우 단축이 10mm 미만으로 감소한 상태. 신규 병변이 없어야 함.
- PR (Partial Response, 부분 관해): 베이스라인 대비 표적 병변 장경 합이 30% 이상 감소한 상태.
- SD (Stable Disease, 안정 병변): PR 기준에 도달할 만큼 충분히 줄어들지도, PD 기준에 해당할 만큼 늘어나지도 않은 상태.
- PD (Progressive Disease, 질환 진행): 치료 중 기록된 가장 작은 장경 합(Nadir) 대비 20% 이상 증가하고, 절대수치로도 최소 5mm 이상 증가한 상태. 또는 신규 병변이 발생한 경우.


#table(
  columns: (0.8fr, 1.2fr, 1.2fr),
  inset: 3pt,
  align: horizon,
  table.header([반응 유형], [표적 병변 기준], [신규 병변]),
  [CR], [완전 소실], [없음],
  [PR], [30% 이상 감소], [없음],
  [SD], [PR/PD 사이 유지], [없음],
  [PD], [20% 이상 증가], [발생 시 즉각 PD]
)

= 주요 평가 지표 (Endpoints)

- OS (Overall Survival, 전체 생존 기간): 무작위 배정(또는 치료 시작)부터 어떤 원인에 의한 사망까지의 시간. 항암제 임상에서 가장 신뢰받는 골드 스탠다드 지표임.
- ORR (Objective Response Rate, 객관적 반응률): 전체 환자 중 CR 또는 PR을 달성한 환자의 비율. 약물의 직접적인 항종양 효과를 보여줌.
- DCR (Disease Control Rate, 질병 조절률): 종양이 줄어들거나(CR, PR) 최소한 더 커지지 않은(SD) 환자의 비율(CR + PR + SD).
- PFS (Progression-Free Survival, 무진행 생존 기간): 무작위 배정부터 질병이 진행(PD)되거나 사망하기까지의 시간. '병이 나빠지지 않고 생존하는 기간'을 의미함.
- DoR (Duration of Response, 반응 지속 기간): CR 또는 PR에 도달한 환자들을 대상으로, 반응이 처음 나타난 시점부터 질병 진행(PD) 또는 사망까지의 시간. 약효의 지속성을 확인하는 지표임.

#table(
  columns: (0.8fr, 1.5fr, 1fr),
  align: horizon,
  inset: 3pt,
  table.header([지표], [정의], [분석 대상]),
  [PFS], [시작 → PD/사망], [전체 환자],
  [OS], [시작 → 사망], [전체 환자],
  [DoR], [응답 → PD/사망], [반응군(CR/PR)]
)

= Line of Therapy (치료 차수):
- 1st Line (1차 치료): 해당 질환에 대해 처음으로 시도하는 표준 치료.
- 2nd Line (2차 치료): 1차 치료 실패(내성 발생 등) 후 진행하는 다음 단계의 치료.
- 3rd Line (3차 치료): 2차 실패 후 시도. 선택적 치료로, 임상시험 참여나 타겟 치료제가 주로 적용되며 효과가 제한적.
- Later Line (4차 이상): 여러 차수 실패 후 시도하는 치료. 치료 차수가 길어질수록 일반적인 항암제 독성 및 체력 저하가 누적되어 환자 관리 난이도가 증가.

= Adverse Events (이상사례)

- TRAE (Treatment-Related Adverse Event): 투여한 약물과의 인과관계를 배제할 수 없는(관련이 의심되는) 이상사례임.
- TEAE (Treatment-Emergent Adverse Event): 약물 투여 전에는 없었으나 투여 후 새로 발생하거나 기존 증상이 악화된 모든 이상사례임.
- TESAE (Treatment-Emergent Serious Adverse Event): 치료 과정 중 발생한 '중대한' 이상사례(SAE). 입원, 생명 위협, 영구적 장애 등이 해당됨.
- irAE (Immune-Related Adverse Event): 면역항암제 투여로 인해 면역 체계가 과활성화되어 정상 조직을 공격하며 발생하는 부작용.
  - 피부 반응: 발진, 가려움증(pruritus)이 가장 흔하며, 전체 irAE의 30-50%를 차지. 일반적으로 경증이지만 스테로이드로 관리.
  - 갑상선 기능 이상: 갑상선염으로 인한 갑상선 기능 저하증(hypothyroidism)이 15% 정도 발생, pembrolizumab 환자에서 빈번.
​  - 장염(colitis): 설사와 복통으로 나타나며, 중증(grade 3 이상) 시 입원 필요. ipilimumab 치료에서 높음.
- SAE (Serious Adverse Event, 중대한 이상사례): 사망, 생명의 위협, 입원 연장, 지속적 장애 등을 초래하는 사건. 발생 시 24시간 이내에 규제 기관 보고 대상임.
- AST/ALT (간 효소 수치): 간 세포 손상 정도를 나타내는 지표. 약물 유도성 간 손상(DILI) 확인을 위해 필수적으로 모니터링함.

= CTCAE

Common Terminology Criteria for Adverse Events (공통 용어 부작용 기준)의 약어. 미국 국립암연구소(NCI)가 개발한 이상사례의 심각도 분류 시스템.
2025년 7월 NCI에서 발표된 최신 버전은 CTCAE v6.0이다.

- Grade 1 (Mild): 경미 (무증상 또는 약한 증상).
- Grade 2 (Moderate): 중등도 (국소적 치료 필요, 일상생활 일부 제한).
- Grade 3 (Severe): 중증 (입원 필요, 자가 관리 제한).
- Grade 4 (Life-threatening): 생명 위협 (긴급 처치 필요).
- Grade 5 (Death): 사망.

= 임상시험 시각화 기법

== Kaplan-Meier 곡선

OS/PFS 생존 분석에 사용됨.
곡선의 높이는 특정 시점까지 생존(무진행 생존)할 확률을 의미하며, 곡선이 급격히 떨어질수록 사건(사망/진행) 발생률이 높다는 뜻으로 해석함.

#figure(
  image("images/survival_plot.png", width: 100%),
  caption: [Kaplan-Meier Curve]
) <survival>

== Spider plot

시간별 종양 반응 추적에 활용됨.
각 선은 한 환자를 나타내며, 기준 대비 종양 크기 변화(%)가 시간이 지남에 따라 어떻게 증가·감소하는지 확인해 반응의 시작·지속·진행 시점을 파악함.

#figure(
  image("images/spider_plot.png", width: 100%),
  caption: [Spider plot]
) <spider>

== Swimmer plot

환자별 사건 발생 타임라인을 보여줌.
각 막대는 환자 한 명의 추적 기간을 나타내며, 막대의 길이와 표시된 기호를 통해 치료 기간, 반응 발생/소실, 진행, 중단 시점 등을 직관적으로 해석함.

#figure(
  image("images/swimmer_plot.png", width: 100%),
  caption: [Swimmer plot]
) <swimmer>

== Waterfall plot

환자별 종양 크기 변화를 나타냄.
각 막대는 환자별 최대 종양 크기 변화를 의미하며, 0선 아래로 내려간 막대는 종양 축소(부분/완전 반응 가능성), 위로 올라간 막대는 종양 증가(진행 또는 비반응)를 시각적으로 보여줌.

#figure(
  image("images/waterfall_plot.png", width: 100%),
  caption: [Waterfall plot]
) <waterfall>

== Forest plot

메타분석 결과를 요약함.
각 가로선은 개별 연구의 효과 추정치와 신뢰구간을, 다이아몬드는 전체 통합 효과와 신뢰구간을 나타내며, 수직 기준선(효과 없음) 기준으로 왼쪽/오른쪽 위치에 따라 유의한 이득 또는 위험 증가 여부를 판단함.

#figure(
  image("images/forest_plot.png", width: 100%),
  caption: [Forest plot]
) <forest>


= 약동학/약력학 관련 용어

- PK (Pharmacokinetics): 약동학. 몸이 약을 어떻게 처리하는가? (흡수, 분포, 대사, 배설: ADME)
- PD (Pharmacodynamics): 약력학. 약이 몸에 어떤 작용을 하는가? (생리적 반응, 기전 연구)
- Cmax (Maximum Concentration): 약물 투여 후 혈중 농도가 가장 높게 올라가는 시점의 농도.
- Tmax (Time to Maximum Concentration): Cmax에 도달하기까지 걸리는 시간.
- AUC (Area Under the Curve): 농도-시간 곡선 아래 면적. 체내 약물 노출량을 나타냄.
- Half-life (T½, 반감기): 혈중 약물 농도가 절반으로 감소하는 데 걸리는 시간.
- Bioavailability (생체이용률): 투여된 약물 중 실제 전신 순환에 도달하는 비율.
- Clearance (CL, 청소율): 약물이 체내에서 제거되는 속도. 간 대사, 신장 배설 등에 영향받음.
- Volume of Distribution (Vd, 분포용적): 약물이 체내에 분포하는 정도를 나타내는 가상 체적.
- Steady State (정상상태): 반복 투여 시 약물의 투입량과 제거량이 평형에 도달한 상태.

= 자주 사용되는 암종 약어

임상에서 가장 흔히 사용되는 암종 약어 목록. NCCN/ESMO 가이드라인 기준 표준 치료법을 포함.

​- AML (Acute myeloid leukemia): 급성골수성백혈병, 표준 치료: 화학요법/Veno+Azacitidine
- BC (Breast cancer): 유방암, 표준 치료: 수술/방사선/호르몬요법/Trastuzumab
- CC (Cervical cancer): 자궁경부암, 표준 치료: CCRT(Cisplatin+방사선)
- CRC (Colorectal cancer): 대장암, 표준 치료: 수술/FOLFOX(항암화학요법)/FOLFIRI+Bevacizumab
- EOC (Epithelial ovarian cancer): 난소상피암, 표준 치료: 수술+Platinum기반요법
- GC (Gastric cancer): 위암, 표준 치료: 수술/FLOT/XELOX
- HCC (Hepatocellular carcinoma): 간암, 표준 치료: TACE/Sorafenib/Lenvatinib
- HNSCC (Head and neck squamous cell carcinoma): 두경부편평상피세포암, 표준 치료: 수술/CCRT
- MM (Malignant melanoma): 흑색종, 표준 치료: 수술/면역치료(PD-1/MEK inhibitor)/표적치료(BRAF inhibitor)
- NSCLC (Non-small cell lung cancer): 비소세포폐암, 표준 치료: 수술/방사선/표적치료(EGFR TKI)/면역치료
- PC (Prostate cancer): 전립선암, 표준 치료: 수술/방사선/호르몬요법
- PDAC(Pancreatic ductal adenocarcinoma): 췌장암, 표준 치료: 수술/Gemcitabine+nab-Paclitaxel/FOLFIRINOX.
- RCC (Renal cell carcinoma): 신세포암, 표준 치료: 수술/표적치료(Sunitinib)/면역치료
​- SCC (Squamous cell carcinoma): 편평세포암, 표준 치료: CCRT/수술
- SCLC (Small cell lung cancer): 소세포폐암, 표준 치료: 화학요법(Platinum+ETP)+방사선
- TC (Thyroid cancer): 갑상선암, 표준 치료: 수술+방사성요오드치료
- UBC (Urothelial bladder cancer): 방광암, 표준 치료: BCG/수술/Cisplatin 기반 화학요법
​