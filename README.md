# FinalProject_nuts
파이널 프로젝트 3팀 견과류

![image](https://user-images.githubusercontent.com/86838449/156928440-65d07c12-b21d-4479-9c77-06f68901464b.png)

---
![image](https://user-images.githubusercontent.com/86838449/156928356-da6b2f1a-a913-42da-9af1-ab31874ff3a2.png)
---


![image](https://user-images.githubusercontent.com/86838449/156928212-2c9677c8-22f1-4904-8c9d-a365ad6ab94b.png)
---



기능
---
![image](https://user-images.githubusercontent.com/86838449/156927885-3841ad5c-9d9d-4eff-8508-8d2b9a11c9cf.png)
---
![image](https://user-images.githubusercontent.com/86838449/156927905-e48984cf-36fe-4814-bf34-7db82845552d.png)
- 로그인
    - 정상적으로 로그인 시 로그인한 아이디 정보를 세션에 저장
    - 세션에 저장된 아이디 정보 확인 후 관리자 아이디라면 관리자용 기능 활성화
    
- 회원가입
    - ajax를 통해 아이디 중복 결과 출력
    - JavaScript를 통해 비밀번호 확인 결과 출력
---
![image](https://user-images.githubusercontent.com/86838449/156927937-43f3ec31-00d1-40c3-880e-00b3f6c09652.png)
- 산책 모임 생성
    - ID를 세션에 저장하여 로그인을 안한 경우 로그인페이지로 이동하도록 구현
    - 카카오맵 API를 활용하여 지도에 좌표를 찍을 때 마다 선이 그려지고 찍힌 좌표 값을 배열에 저장하여 submit할 때 파라메터를 통해 값을 가져올 수 있도록 구현
    - 카카오맵 라이브러리를 활용하여 좌표에 대해 주소로 받아 올 수 있도록 구현
    - 마커에 마우스 오버 시 충전소 정보 조회하는 오버레이 생성
    
- 산책 모임 신청
    - ID를 세션에 저장하여 로그인 한 경우 신청 가능하도록 구현
    - 카카오맵 API를 활용하여 저장된 좌표들을 이용해 폴리라인 구현
    - 신청버튼 누를 시 REST API를 통해 DB에 신청 컬럼 생성하도록 구현
    - 닉네임/날짜로 검색하는 기능 구현
    - 중복 방지를 위해 페이지 로딩 시 신청한 모임은 신청 완료 및 disable속성이 들어가도록 구현
    - 메인 지도 마커 마우스오버 시 폴리라인이 생기도록 기능 구현
    - 메인 지도 마커 클릭 시 상세정보 오버레이 나오도록 기능 구현
---
![image](https://user-images.githubusercontent.com/86838449/156927959-9108fac5-c91e-4247-b620-6d45b7fafd48.png)
- 공원 목록 조회
    - 공원 공공데이터 API 파싱 및 DB에 저장
    - 공원 좌표를 카카오맵 API를 이용하여 지도에 마커 구현
    - 공원 목록 클릭 시 마커를 중심으로 가져올 수 있도록 기능 구현
    - 페이징 기능 구현
---
![image](https://user-images.githubusercontent.com/86838449/156928004-89443cb5-2a20-4ca9-96b0-8dee96d45c0a.png)
- 넛츠마켓 기능 구현
    - 네이버 검색 쇼핑 API를 활용하여 정보 파싱 및 리스트로 받아 목록으로 구현
    - 상품명 클릭 시 네이버 최저가 확인 사이트로 이동하도록 기능 구현
    - 검색 시 네이버 API요청 파라메터값을 동적으로 받아 원하는 상품정보를 받을 수 있도록 기능 구현
---
![image](https://user-images.githubusercontent.com/86838449/156928067-657bed38-b408-45a5-9c55-89db697bd256.png)
---
![image](https://user-images.githubusercontent.com/86838449/156928090-092dec09-d343-4929-b206-33d754f6545e.png)
- 커뮤니티(핫도그)
    - 핫도그 CRUD 기능 구현
    - 게시글 작성 시 사진만 첨부 가능하며 다중 업로드가 될 수 있도록 기능 구현
    - REST API를 활용하여 좋아요 기능 구현
    - 세션에 저장된 ID를 확인하여 작성자와 동일 할 시 수정 및 삭제가 가능하도록 구현
    - 다중업로드 된 이미지 파일을 불러와 슬라이드로 보이도록 기능 구현
    - 페이징 구현
---
![image](https://user-images.githubusercontent.com/86838449/156928127-35276ffa-bd5f-49d4-baa3-c278a281ec96.png)
- 공지사항
    - 공지사항 CRUD 기능 구현
    - 페이징 구현
    - 세션에 저장된 ID를 확인하여 작성자가 admin 일 시 작성 및 수정, 삭제가 가능하도록 기능 구현
---
![image](https://user-images.githubusercontent.com/86838449/156928157-2704ea43-c6ff-4f3b-890e-a6ce87e3a376.png)
![image](https://user-images.githubusercontent.com/86838449/156928167-6c1c1b3c-32a4-45a4-916f-c941d172d899.png)
- 마이페이지
    - 모달을 통한 신청자 현황 확인 및 미확인 신청확인 테이블 갯수가 1개 이상일 시 빨간색으로 표시 되도록 구현
    - 신청자 현황 확인에서 수락, 거절 버튼을 통해 상태변경되도록 기능 구현
    - 보낸 신청 수락, 거절에 따라 "참여한 산책"에 나오도록 기능 구현
    - 프로필 수정으로 프로필 사진 및 프로필 정보 수정가능하도록 기능 구현
