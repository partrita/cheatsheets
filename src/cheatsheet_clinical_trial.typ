#import "./templates/conf.typ": *

#show: template.with(
  title: "임상시험 용어 치트시트",
  header: [#datetime.today().display()],
  footer: "*주의: 실제 임상 적용 시 가이드라인 재확인 필요",
)

#show table: set text(size: 7pt)
#set table(stroke: 0.3pt)

= 주요 약어 및 용어
- AE (Adverse Event): 이상사례. 약물 투여 후 발생한 모든 유해 증상 (인과관계 무관)
- CI (Confidence Interval): 신뢰구간. 동일 연구 반복 시 기대값 포함 범위 (보통 95%)
- DLT (Dose-Limiting Toxicity): 용량 제한 독성. 증량 중단 및 MTD 결정의 기준이 되는 심각한 독성
- EHR (Electronic Health Record): 전자 건강 기록. 디지털화된 환자 진료 정보
- HR (Hazard Ratio): 위험비. 두 집단 간 사건 발생 속도 비율 (1보다 크면 위험 증가)
- MTD (Maximum Tolerated Dose): 최대 내약 용량. DLT가 허용 범위를 넘지 않는 최대 투여량
- OR (Odds Ratio): 오즈비. 집단 간 사건 발생 가능성 비율
- P-value: 유의 확률. 결과가 우연일 확률 (통상 0.05 미만 시 통계적 유의성 확보)
- RP2D (Recommended Phase 2 Dose): 2상 권장 용량. 1상 결과 기반 최적 균형 용량
- SAD / MAD: 단일 / 다중 용량 상승 시험 (용량 탐색 기초 단계)
- Q3W (Every 3 Weeks): 3주(21일) 간격 투여 주기

= 임상 프로토콜 및 디자인
- 3+3 디자인: 클래식 용량 증량법. 3명 단위로 DLT 확인하며 증량 여부 결정
- BOIN 디자인: 베이지안 기반 최적 구간 설계. 3+3보다 정밀한 용량 조정 가능
- Arm: 임상 내 치료군 분류 (예: Arm 1 표준치료, Arm 2 신약 병용)

= 분석 피험자 집단 (Analysis Set)
- ITT (Intention-To-Treat): 무작위 배정된 모든 피험자 대상 분석 (보수적 접근)
- FAS (Full Analysis Set): ITT에서 최소한의 제외 사유(투여 미실시 등)만 제거한 집단
- PPS (Per Protocol Set): 프로토콜을 완벽히 준수한 피험자 집단 (효능 분석용)
- SS (Safety Set): 시험약을 1회 이상 투여받은 모든 피험자 (안전성 분석용)

= RECIST 1.1 (고형암 반응 평가 기준)
- CR (Complete Response): 완전 관해. 모든 표적 병변 소실
- PR (Partial Response): 부분 관해. 표적 병변 직경 합 30% 이상 감소
- SD (Stable Disease): 안정 병변. PR/PD 기준에 미달하는 상태
- PD (Progressive Disease): 질환 진행. 최저점 대비 20% 이상 증가 또는 신규 병변 발생

= 주요 평가 지표 (Endpoints)
- OS (Overall Survival): 전체 생존 기간. 무작위 배정부터 사망까지의 시간 (골드 스탠다드)
- ORR (Objective Response Rate): 객관적 반응률. CR 또는 PR 달성 환자 비율
- PFS (Progression-Free Survival): 무진행 생존 기간. 질병 진행 또는 사망 전까지의 시간
- DoR (Duration of Response): 반응 지속 기간. 반응 시작부터 진행/사망까지의 시간

= 이상사례 분류 (CTCAE)
- Grade 1: 경미 (무증상/경증)
- Grade 2: 중등도 (일상생활 지장, 국소 치료 필요)
- Grade 3: 중증 (입원 필요, 자가 관리 제한)
- Grade 4: 생명 위협 (긴급 처치 필수)
- Grade 5: 사망

= 약동학/약력학 (PK/PD)
- PK: 약동학. 체내 흡수, 분포, 대사, 배설 (ADME) 과정
- PD: 약력학. 약물의 생리적 작용 및 기전
- Cmax / Tmax: 최고 혈중 농도 및 도달 시간
- AUC: 혈중 농도-시간 곡선 아래 면적 (체내 노출량)
- Half-life (T½): 반감기. 농도가 절반으로 줄어드는 시간
