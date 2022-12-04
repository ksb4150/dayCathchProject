# 날잡아 프로젝트(호텔/티켓 예약 사이트)

### 1. 개발환경 <br>
### Front-End
* HTML5
* CSS3
* JavaScript
* jQuery 3.6.0
### Back-End
* JAVA 1.7
* JSP
* MyBatis
* SpringBoot
* Tiles
* Tomcat v.9.0
* Gradle
### API, 라이브러리
* 카카오 로그인/페이/맵/주소찾기
* 네이버 로그인
* REST API(공공데이터포털)
* Summernote
* iamport
* FullCalendar
* Datapicker
* Chart.js

2. 설계
### 프로젝트 구조
![캡1](https://user-images.githubusercontent.com/74931459/205484694-54a54ff3-56b5-45e8-a70f-470d14152af3.JPG) <br>
저장소에 있는 board, goods, user 폴더를 넣을 위치입니다. 해당 폴더들은 사업자가 자신의 사진을 등록할 때, 사업자가 자신의 상품 사진을 등록할 때, 사용자가 게시글에 이미지를 등록할 때
사진들이 저장되는 위치입니다. 변경하기 위해서는 아래 사진을 참고해주세요.

![파일 변경](https://user-images.githubusercontent.com/74931459/205484711-b5e4d155-8318-433a-9c57-3c617bda52ec.JPG) <br>
이미지가 저장되고 보여지기 위한 경로는 위 사진과 같이 총 4개의 Controller의 상단에 선언되어 있습니다. 경로를 변경하고 싶으시다면 해당 경로를 수정해주세요.

### 데이터베이스 모델링
> 회원 정보를 담고 있는 user 테이블의 uid가 주요 외래키로 설정되어 있습니다. <br> 저장소에 있는 20221115.sql 파일을 사용하시는 DB에 import 후 Query를 실행해주세요.
![최종 db ER (1)](https://user-images.githubusercontent.com/74931459/205484962-a39f101a-babd-474a-8605-8a1b3423555f.JPG)
