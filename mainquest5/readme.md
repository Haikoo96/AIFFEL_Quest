# **회고**
1. 우선 역시 dart 와 Flutter가 익숙하지 않아 페이지간 데이터 전송 구현을 chatgpt에 의존했다.
2. chatgpt의 코드를 보고 학습하는 방향으로 이번 퀘스트를 진행하였다.
3. 그리고 화면 구성은 책에 있는 코드를 거진 같다가 썼다(아직은 직접 구현은 어렵다.)
4. 모델 inference 까지 구현이 어려워 우선 user flow를 인지하기 위해 inference 대신 다른 사진을 넣어 퀴즈 형태로 구현했다.

# **화면 구동 사진**
![flutter](https://github.com/Haikoo96/aiffel_quest_re/blob/main/mainquest5/%ED%99%94%EB%A9%B4%EA%B5%AC%EB%8F%99.png)

# **화면 구성**
![wireframe](https://github.com/Haikoo96/aiffel_quest_re/blob/main/mainquest5/wireframe.png)

- figma 링크: https://www.figma.com/file/sR3emhW5wsOOGPyLNZ1N2K/Mainquest5?type=design&node-id=9%3A45&mode=design&t=t6cYyc0tbhd8oEgF-1

# **앞으로 계획**
- 우선 화면 구성을 보면 구동사진이랑 달라서 추후 프로젝트 시작할 시 수정할 계획.
- 실제 프로젝트에서 구현시 fastapi나 tflite로 asset에 등록해서 해볼 생각
- 결과 확인 버튼을 눌렀을때 모델 prediction과 유저 prediction을 비교하는 양상으로 구현할 계획
    - 버튼을 눌렀을때 JSON형식으로 모델 prediction을 받아서 데이터를 처리하는 구현이 필요해보임.
    - 모델 prediction과 유저 prediction이 일치하면 비기는 게임
    - 유저가 맞으면 이긴게임
    - 유저가 틀리면 진 게임으로 user flow를 가져갈 생각
- user flow는 프리아이펠톤 혹은 기획 기간에 더 세밀하게 만져볼 계획