﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/getbook.js"></script>
</head>
<body>

<div id="getBookTable"></div>

<button class='searchBookBtn'>SearchBookBtn</button>

<script>
let bookData="";
//bookData={"documents":[{"authors":["조앤 K. 롤링"],"contents":"선과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나가는 보편적인 테마를 바탕으로 빈틈없는 소설적 구성과 생생하게 살아 있는 캐릭터, 정교하게 만들어낸 환상의 세계를 접목시킨 21세기의 고전 「해리포터 시리즈」의 제5편『해리포터와 불사조 기사단』 제1부. 사사건건 해리를 괴롭히는 사촌 두들리와 다투다 디멘터의 습격을 받은 해리는 우여곡절 끝에 친구 론과 헤르미온느가 있는 불사조 기사단의 비밀 본부로 가게 된다. 볼드모트에 대항하는","datetime":"2016-09-15T00:00:00.000+09:00","isbn":"8983925604 9788983925602","price":24500,"publisher":"문학수첩","sale_price":22050,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1174478%3Ftimestamp%3D20190127040831","title":"해리포터(Harry Potter): 불사조 기사단. 1(양장본 HardCover)","translators":["최인자"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1174478\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%28Harry+Potter%29%3A+%EB%B6%88%EC%82%AC%EC%A1%B0+%EA%B8%B0%EC%82%AC%EB%8B%A8.+1%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["조디 리벤슨"],"contents":"재미있고 위풍당당하며 무서우면서도 사랑스러운 《해리 포터》 속 생명체와 동물들. 해리의 반려동물 헤드위그부터 평생 동안 단 하나의 마법사 가문을 위해 일하는 집요정, 아즈카반을 지키는 유령 같은 어둠의 생명체 디멘터, 론이 ‘윙가르디움 레비오우사’ 주문을 정확하게 발음하고 간신히 물리친 트롤, 비명을 지르는 맨드레이크 등 『해리포터(Harry Potter): 생명체 금고』에는 이처럼 신비한 생명체들과 관련된 다채로운 이야기를 담고 있다.  《해리 포터","datetime":"2016-11-07T00:00:00.000+09:00","isbn":"8983926279 9788983926272","price":35000,"publisher":"문학수첩","sale_price":31500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1175758%3Ftimestamp%3D20190127041859","title":"해리포터(Harry Potter): 생명체 금고(양장본 HardCover)","translators":["고정아"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1175758\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%28Harry+Potter%29%3A+%EC%83%9D%EB%AA%85%EC%B2%B4+%EA%B8%88%EA%B3%A0%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["조앤 K. 롤링"],"contents":"선과 악의 대립 속에서 평범한 어린 소년이 한 사람의 영웅으로 성장해나가는 보편적인 테마를 바탕으로 빈틈없는 소설적 구성과 생생하게 살아 있는 캐릭터, 정교하게 만들어낸 환상의 세계를 접목시킨 21세기의 고전 「해리포터 시리즈」가 국내 출간 15주년을 맞았다. 이를 기념해 표지 일러스트를 교체하고 그간 지적되어 온 번역 오류 등을 꼼꼼하게 감수하고 면밀하게 검토해 수정하였고 원서의 다양한 서체를 최대한 반영해 몰입감을 높여 새롭게 시리즈를 펴냈다.  손","datetime":"2014-12-18T00:00:00.000+09:00","isbn":"8983925329 9788983925329","price":9000,"publisher":"문학수첩","sale_price":8100,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1169809%3Ftimestamp%3D20190127033309","title":"해리포터: 마법사의 돌. 2","translators":["김혜원"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1169809\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%3A+%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98+%EB%8F%8C.+2"},{"authors":["Rowling J K/ GrandPre Mary (ILT)"],"contents":"해리 포터와 친구들의 마법학교에서의 모험과 성장을 그린 베스트셀러 소설. 무서운 이모부부와 함께 계단 밑 작은 방에서 비참한 삶을 살던 해리는 부엉이 한 마리가 배달한 초대장에 인생이 바뀌기 시작한다. 새로운 친구와 온갖 마법을 배우며 해리는 어둠의 힘과 결투를 벌이는데....   Harry Potter 시리즈 모두보기 -\u0026gt; Click!     Harry Potter has never been the star of a Quidditch team, scoring","datetime":"1999-09-07T00:00:00.000+09:00","isbn":"059035342X 9780590353427","price":13100,"publisher":"Scholastic","sale_price":7800,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1755607%3Ftimestamp%3D20190201023135","title":"Harry Potter and the Sorcerer's Stone","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1755607\u0026q=Harry+Potter+and+the+Sorcerer%27s+Stone"},{"authors":["조앤 K. 롤링"],"contents":"All seven phenomenal Harry Potter paperback books by best selling author J.K. Rowling are available together for the first time in an elegant paperback boxed set!   ★ Set Includes ★  - Harry Potter and the Sorcerer's Stone - Harry Potter and the Chamber","datetime":"2009-07-07T00:00:00.000+09:00","isbn":"0545162076 9780545162074","price":99000,"publisher":"Scholastic","sale_price":57600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F2457417%3Ftimestamp%3D20190420101432","title":"해리포터 Harry Potter Paperback Boxset #1-7","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=2457417\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0+Harry+Potter+Paperback+Boxset+%231-7"},{"authors":["조디 리벤슨"],"contents":"죽음의 성물, 호그와트 비밀 지도, 마법사의 돌을 비롯 호그와트 학생들의 사랑스런 러브레터까지!  ★특별 부록★ 책 속의 책: 음유시인 비들 이야기 원본 블랙 가계도 태피스트리","datetime":"2018-11-30T00:00:00.000+09:00","isbn":"8983927240 9788983927248","price":35000,"publisher":"문학수첩","sale_price":31500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F4818238%3Ftimestamp%3D20190302225046","title":"해리포터 마법 도구 금고(양장본 HardCover)","translators":["고정아"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=4818238\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0+%EB%A7%88%EB%B2%95+%EB%8F%84%EA%B5%AC+%EA%B8%88%EA%B3%A0%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["롱테일북스 편집부"],"contents":"「원서 읽는 단어장」 시리즈 『Harry Potter And The Sorcerer's Stone』. 영어원서에 나온 어려운 어휘들을 정리하여 원서 읽기의 부담감을 줄이고 보다 효과적으로 영어실력을 쌓을 수 있도록 도와주는 책이다. 'The Trace of Harry Potter'를 통해 원서를 제대로 읽고 이해하고 있는지 측정해보고, 'The Sorcerer's Vocabulary'를 통해 원서에 등장하는 어려운 어휘를 알아본다. \u0026lt;빈도","datetime":"2014-07-31T00:00:00.000+09:00","isbn":"8956054428 9788956054421","price":6000,"publisher":"롱테일북스","sale_price":5400,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F723961%3Ftimestamp%3D20190124152055","title":"해리포터와 마법사의 돌(Harry Potter and the Sorcerer's Stone)(원서 읽는...","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=723961\u0026q=%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%EC%99%80+%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98+%EB%8F%8C%28Harry+Potter+and+the+Sorcerer%27s+Stone%29%28%EC%9B%90%EC%84%9C+%EC%9D%BD%EB%8A%94+%EB%8B%A8%EC%96%B4%EC%9E%A5%29"},{"authors":["JK라림"],"contents":"","datetime":"2002-01-01T00:00:00.000+09:00","isbn":"702003344X 9787020033447","price":13500,"publisher":"인민문학출판사","sale_price":-1,"status":"","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F2715084%3Ftimestamp%3D20190215164737","title":"합리파특(밀실)(중문)-해리포터","translators":["마애신"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=2715084\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%EB%B0%80%EC%8B%A4%29%28%EC%A4%91%EB%AC%B8%29-%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0"},{"authors":[],"contents":"","datetime":"2002-01-01T00:00:00.000+09:00","isbn":"702003344X 9787020033447","price":13500,"publisher":"인민문학출판사","sale_price":36240,"status":"정상판매","thumbnail":"","title":"합리파특(밀실)(중문)-해리포터","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=323702\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%EB%B0%80%EC%8B%A4%29%28%EC%A4%91%EB%AC%B8%29-%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0"},{"authors":["편집부"],"contents":"","datetime":"2001-12-01T00:00:00.000+09:00","isbn":" 2015106000012","price":40000,"publisher":"인민문학출판사","sale_price":-1,"status":"","thumbnail":"","title":"합리파특(해리포터)(중문)(전4권)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=295140\u0026q=%ED%95%A9%EB%A6%AC%ED%8C%8C%ED%8A%B9%28%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B0%29%28%EC%A4%91%EB%AC%B8%29%28%EC%A0%844%EA%B6%8C%29"}],"meta":{"is_end":false,"pageable_count":239,"total_count":277}};
bookData={"documents":[{"authors":["홍혜경"],"contents":"『영유아를 위한 수학교육』은 유아교육과, 보육학과, 아동학과, 사회복지 관련학과에서 예비교사들을 위한 영유아의 발달적 수학능력에 적합하고, 영유아의 수학적 사고를 촉진할 수 있는 영유아 수학교육의 이론적 이해와 실제를 배우고 강의하는 데 활용할 수 있는 교재이다. 특히 예비교사나 현장교사들에게 필요한 영유아 수학교육의 최신 동향을 반영하는 질높은 영유아 수학교육을 위한 이론적 이해와 실제적 적용을 위한 구체적인 방안을 제시하였으며, 특히 영아를 위한 수학","datetime":"2010-07-30T00:00:00.000+09:00","isbn":"8963520943 9788963520940","price":19000,"publisher":"공동체","sale_price":18810,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F885958%3Ftimestamp%3D20190125180650","title":"수학교육(영유아를 위한)(양장본 HardCover)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=885958\u0026q=%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%98%81%EC%9C%A0%EC%95%84%EB%A5%BC+%EC%9C%84%ED%95%9C%29%28%EC%96%91%EC%9E%A5%EB%B3%B8+HardCover%29"},{"authors":["Anita A Wager (엮음)","David W Stinson (엮음)"],"contents":"『사회정의를 위한 수학교육』은 사회정의를 위한 수학교육의 의미와 교실에서의 가능성 및 해결과제에 대한 학자들과 교사들의 이야기를 담고 있다. 우리나라에서 생소한 비판적 교육학과 사회정의를 위한 수학교육에 대한 전반적인 이해를 하는데 도움이 될 수 있을 것이다.","datetime":"2015-04-01T00:00:00.000+09:00","isbn":"8961058355 9788961058353","price":22000,"publisher":"경문사","sale_price":20680,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F845518%3Ftimestamp%3D20190125100829","title":"수학교육(사회정의를 위한)(경문수학교육학)","translators":["박만구"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=845518\u0026q=%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%82%AC%ED%9A%8C%EC%A0%95%EC%9D%98%EB%A5%BC+%EC%9C%84%ED%95%9C%29%28%EA%B2%BD%EB%AC%B8%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%ED%95%99%29"},{"authors":["수전 K 존슨","제임스 켄드릭"],"contents":"수학교육 이론서. 수학교육에 대한 기본이해에서부터 수학교육과정에 이르기까지, 수학을 교육하는 이들이 알아야 할 사항을 체계적으로 정리하였다.","datetime":"2009-10-10T00:00:00.000+09:00","isbn":"8961052578 9788961052573","price":10000,"publisher":"경문사","sale_price":9900,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F844728%3Ftimestamp%3D20190125095804","title":"수학교육(영재를 위한)","translators":["남승인"],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=844728\u0026q=%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%98%81%EC%9E%AC%EB%A5%BC+%EC%9C%84%ED%95%9C%29"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 초등학교 4학년 - 구성 : 이론 + 문제 - 특징 : 개정 교육과정 반영","datetime":"2017-11-24T00:00:00.000+09:00","isbn":"8926153460 9788926153468","price":14000,"publisher":"디딤돌","sale_price":12600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F431869%3Ftimestamp%3D20190123031407","title":"초등 수학 4-1(2019)(최상위S)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=431869\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+4-1%282019%29%28%EC%B5%9C%EC%83%81%EC%9C%84S%29"},{"authors":["박재옥","홍길회"],"contents":"『영유아를 위한 수학교육』은 예비교사에게 의미 있는 수학 경험을 지원하고자 합니다. 즉, 표준보육과정과 누리과정의 자연탐구 영역을 적용한 영아수학교육의 방안을 기본 방향으로 하여, 예비교사들에게 영유아 수학교육의 전문가로 자질을 갖출 수 있도록 하는 데 역점을 두었습니다.","datetime":"2017-03-02T00:00:00.000+09:00","isbn":"8982519149 9788982519147","price":20000,"publisher":"동문사","sale_price":19400,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1148200%3Ftimestamp%3D20190127005833","title":"수학교육(영유아를 위한)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1148200\u0026q=%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%98%81%EC%9C%A0%EC%95%84%EB%A5%BC+%EC%9C%84%ED%95%9C%29"},{"authors":["이병혁","김영표","홍성두","박경옥"],"contents":"이 책은 총 10개 장으로 구성되어 있으며, 크게 이론(1부)과 실제(2부)로 나뉘어 있다. 이론에서는 수학교육에 관한 전반적인 내용과 함께 교육과정, 평가, 그리고 교수 접근 방식 등을 제시하고 있으며, 실제에서는 현 특수학교 교육과정 중 아동의 삶에 실질적인 영향을 줄 수 있는 수와 연산, 도형과 측정을 문제해결 및 생활 수학 등과 함께 정리하였다. 특히 실제에서는 각 하위 영역을 개관하고 이 영역들을 지도하기 위해 현장에서 적용할 수 있는 방법","datetime":"2015-09-15T00:00:00.000+09:00","isbn":"8999707881 9788999707889","price":18000,"publisher":"학지사","sale_price":17460,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1509621%3Ftimestamp%3D20190130122442","title":"수학교육(장애 아동 청소년을 위한)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1509621\u0026q=%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%9E%A5%EC%95%A0+%EC%95%84%EB%8F%99+%EC%B2%AD%EC%86%8C%EB%85%84%EC%9D%84+%EC%9C%84%ED%95%9C%29"},{"authors":["최용준","해법수학연구회"],"contents":"누적 판매량 6,800만 부의 기록을 세운 가장 오랫동안 사랑받은 브랜드 1위의 초등 수학 문제집이다. 수학 교과서 집필진과 함께 만든 문제집으로, 무료 강의와 단원성취도 평가, 스케줄표로 혼자서도 수학을 공부할 수 있으며, 학부모 지도가이드와 서술형에 대비 가능한 과정중심 평가, 정답률 오답률이 제시되어 있어 아이에게 가르쳐 주기에도 좋다.","datetime":"2018-11-20T00:00:00.000+09:00","isbn":"1125938765 9791125938767","price":16500,"publisher":"천재교육사","sale_price":14850,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F4811709%3Ftimestamp%3D20190302215252","title":"초등 수학 5-1(2019)(빅데이터 우등생 해법)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=4811709\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+5-1%282019%29%28%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0+%EC%9A%B0%EB%93%B1%EC%83%9D+%ED%95%B4%EB%B2%95%29"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 초등 4학년 2학기 수학 학습자 - 구성 및 특징 : ① 기본기를 다지는 탄탄한 개념학습 ② 응용력을 완벽하게 잡아주는 단계별 유형문제 ③ 개정 교육과정 완벽 반영","datetime":"2018-05-15T00:00:00.000+09:00","isbn":"8926154246 9788926154243","price":15000,"publisher":"디딤돌","sale_price":13500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F431686%3Ftimestamp%3D20190123031231","title":"초등 수학 4-2 기본 + 응용(2018년)(수학 좀 한다면)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=431686\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+4-2+%EA%B8%B0%EB%B3%B8+%2B+%EC%9D%91%EC%9A%A9%282018%EB%85%84%29%28%EC%88%98%ED%95%99+%EC%A2%80+%ED%95%9C%EB%8B%A4%EB%A9%B4%29"},{"authors":["황의명","조형숙","서동미"],"contents":"이 책은 유아교육학과 대학생들을 위한 유아수학교육 교재이다.","datetime":"2017-03-08T00:00:00.000+09:00","isbn":"8958094893 9788958094890","price":18000,"publisher":"정민사","sale_price":17820,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F772520%3Ftimestamp%3D20190124223406","title":"유아수학교육(3판)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=772520\u0026q=%EC%9C%A0%EC%95%84%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%283%ED%8C%90%29"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 초등 3학년 2학기 수학 학습자 - 구성 및 특징 : ① 기본기를 다지는 탄탄한 개념학습 ② 응용력을 완벽하게 잡아주는 단계별 유형문제 ③ 개정 교육과정 완벽 반영","datetime":"2018-05-15T00:00:00.000+09:00","isbn":"8926154238 9788926154236","price":15000,"publisher":"디딤돌","sale_price":13500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F431984%3Ftimestamp%3D20190123031455","title":"초등 수학 3-2 기본 + 응용(2018년)(수학 좀 한다면)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=431984\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+3-2+%EA%B8%B0%EB%B3%B8+%2B+%EC%9D%91%EC%9A%A9%282018%EB%85%84%29%28%EC%88%98%ED%95%99+%EC%A2%80+%ED%95%9C%EB%8B%A4%EB%A9%B4%29"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 초등학교 3학년 - 구성 : 이론 + 문제 - 특징 : 개정 교육과정 반영","datetime":"2017-11-24T00:00:00.000+09:00","isbn":"8926153452 9788926153451","price":14000,"publisher":"디딤돌","sale_price":12600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F429594%3Ftimestamp%3D20190127130609","title":"초등 수학 3-1(2019)(최상위S)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=429594\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+3-1%282019%29%28%EC%B5%9C%EC%83%81%EC%9C%84S%29"},{"authors":["기적의 계산법 연구회"],"contents":"‘수학공부’를 공부하다. 2004년 \u0026lt;기적의 계산법\u0026gt;이 출간된 이래, \u0026lt;기적의 계산법\u0026gt;으로 자녀의 연산 실력을 탄탄히 쌓은 많은 독자분들께 학교 공부도 잘할 수 있는 ‘좋은 수학책’을 만들어 달라는 요청이 쇄도했습니다. 이에 기적의 학습법 연구회에서 제일 먼저 한 일은 아이들의 학교 수학 공부를 심층적으로 관찰하고 연구하는 것이었습니다. ‘우리가 정말 아이들의 공부를 제대로 이해하고 있는가?’라는 근원적인 부분부터 의문을 품고 아이","datetime":"2018-06-30T00:00:00.000+09:00","isbn":"1188991124 9791188991129","price":15000,"publisher":"길벗스쿨","sale_price":13500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1648560%3Ftimestamp%3D20190131124207","title":"기적의 초등 수학 4-2(2019)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1648560\u0026q=%EA%B8%B0%EC%A0%81%EC%9D%98+%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+4-2%282019%29"},{"authors":["최문섭","최희영","한송이","고길동","송낙천"],"contents":"- 독자대상 : 중학교 1학년 - 구성 : 이론 + 문제 - 특징 ① 모든 상위권 교재의 문제유형서 ② 진도학습에 필수적인 홈워크용 교재","datetime":"2017-07-31T00:00:00.000+09:00","isbn":"8926152987 9788926152980","price":13000,"publisher":"디딤돌","sale_price":11700,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F429526%3Ftimestamp%3D20190123025325","title":"중학 수학 1-1(최상위 수학 라이트)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=429526\u0026q=%EC%A4%91%ED%95%99+%EC%88%98%ED%95%99+1-1%28%EC%B5%9C%EC%83%81%EC%9C%84+%EC%88%98%ED%95%99+%EB%9D%BC%EC%9D%B4%ED%8A%B8%29"},{"authors":["동아출판 편집부"],"contents":"\u0026lt;새교육과정\u0026gt; 재미있는 개념 설명과 반복학습으로 교과서 개념을 탄탄히 다질 수 있다. 특별부록(매칭북)으로 기초력을 향상시킬 수 있는 학습지와 수학 익힘 유사 문제를 제공한다. 교과 역량 문제를 통해 수학 핵심 역량을 강화할 수 있다.  1. 개념학습 강화 재미있는 개념 설명과 반복학습으로 개념 탄탄 2. 익힘책 유형 강화 익힘책 문제의 유형을 분석하여 진도북과 매칭북에 완벽 반영 3. 교과 역량 강화 수학 핵심 역량을 적용한 교과 역량 문제","datetime":"2018-11-10T00:00:00.000+09:00","isbn":"8900433296 9788900433296","price":14000,"publisher":"동아출판","sale_price":12600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F3782000%3Ftimestamp%3D20190725101221","title":"초등 수학 6-1 개념 Start(2020)(큐브 수학S)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=3782000\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+6-1+%EA%B0%9C%EB%85%90+Start%282020%29%28%ED%81%90%EB%B8%8C+%EC%88%98%ED%95%99S%29"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 5학년:수학 학습자 - 구성 및 특징 : ① 최근 경향 반영 ② 학습 내용 체계적으로 구성","datetime":"2018-11-09T00:00:00.000+09:00","isbn":"8926155668 9788926155660","price":14000,"publisher":"디딤돌","sale_price":12600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F4812294%3Ftimestamp%3D20190302215722","title":"초등 최상위 수학S 초5-1(2019)(상위권의 기준)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=4812294\u0026q=%EC%B4%88%EB%93%B1+%EC%B5%9C%EC%83%81%EC%9C%84+%EC%88%98%ED%95%99S+%EC%B4%885-1%282019%29%28%EC%83%81%EC%9C%84%EA%B6%8C%EC%9D%98+%EA%B8%B0%EC%A4%80%29"},{"authors":["권성룡"],"contents":"변화하는 교육 과정에 따른 최근의 수학 교육 동향은 물론, 새로운 학문적 연구를 담아낸 「초등수학교육」 제8권 『테크놀로지와 함께 하는 수학교육』. 컴퓨터를 중심으로 하되, 계산기의 활용까지 포함시킨 테크놀로지와 함께 하는 수학교육 교재다. 전반부와 후반부로 나누어 수학교육에서 테크놀로지의 활용에 대한 이론과 실제를 학습한다. 특히 후반부에서는 LOGO, GSP, Poly, Tessellmania, Excel, Fathom 등의 활용방법을 구체적","datetime":"2009-09-01T00:00:00.000+09:00","isbn":"8961052470 9788961052474","price":20000,"publisher":"경문사","sale_price":19400,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F844726%3Ftimestamp%3D20190125095803","title":"테크놀로지와 함께 하는 수학교육(초등수학교육 8)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=844726\u0026q=%ED%85%8C%ED%81%AC%EB%86%80%EB%A1%9C%EC%A7%80%EC%99%80+%ED%95%A8%EA%BB%98+%ED%95%98%EB%8A%94+%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1%28%EC%B4%88%EB%93%B1%EC%88%98%ED%95%99%EA%B5%90%EC%9C%A1+8%29"},{"authors":["미래엔 편집부"],"contents":"「쏙셈」은 하나 교과서 단원별로 익혀야 할 계산 문제를 구성하여 초등 수학의 기본 실력을 다져줍니다. 둘 계산 원리 학습을 통해 계산 과정을 숙달하고 수가 이루는 관계를 익힐 수 있습니다. 셋 다른 그림 찾기, 숨은 그림 찾기 등 다양한 퍼즐로 재미있게 계산 학습을 할 수 있습니다.","datetime":"2018-04-01T00:00:00.000+09:00","isbn":"1162334762 9791162334768","price":9900,"publisher":"미래엔","sale_price":8910,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1607018%3Ftimestamp%3D20190131055806","title":"초등 수학 3-2(2019)(하루 한장 쏙셈)(쏙셈 시리즈 6)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=1607018\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+3-2%282019%29%28%ED%95%98%EB%A3%A8+%ED%95%9C%EC%9E%A5+%EC%8F%99%EC%85%88%29%28%EC%8F%99%EC%85%88+%EC%8B%9C%EB%A6%AC%EC%A6%88+6%29"},{"authors":["김동환","양신모"],"contents":"수학 기본기를 단기간에! 술술 기초가 잡히는 놀라운 중학수학 한 권으로 총정리. 수학과 담쌓은 친구조차 맘먹고 덤벼들면 1개월이면 충분히 중학수학 3년 치를 뗄 수 있다!  한 권에 어떻게 중학 3년 과정을 모두 담았을까? 변별력을 위해 꼬아 만든 문제, 문제를 위한 문제는 NO! 개념을 쉽게 이해하고 익힐 수 있는 문제만을 엄선했다.  4,000여 기본 문제로 고등수학 만점 대비! 수학은 쉬운 문제를 반복해 풀어 완전히 자기 것으로 만드는 것이","datetime":"2018-11-15T00:00:00.000+09:00","isbn":"896626722X 9788966267224","price":18000,"publisher":"에듀인사이트","sale_price":16200,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F4805846%3Ftimestamp%3D20190302210359","title":"3년치 중학수학 한권으로 총정리","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=4805846\u0026q=3%EB%85%84%EC%B9%98+%EC%A4%91%ED%95%99%EC%88%98%ED%95%99+%ED%95%9C%EA%B6%8C%EC%9C%BC%EB%A1%9C+%EC%B4%9D%EC%A0%95%EB%A6%AC"},{"authors":["디딤돌 편집부"],"contents":"- 독자대상 : 초등 4학년 2학기 수학 학습자 - 구성 및 특징 : ① 최근 경향 반영 ② 학습 내용 체계적으로 구성","datetime":"2018-05-11T00:00:00.000+09:00","isbn":"8926154343 9788926154342","price":14000,"publisher":"디딤돌","sale_price":12600,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F429725%3Ftimestamp%3D20190514101057","title":"초등 수학 4-2(2019)(최상위S)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=429725\u0026q=%EC%B4%88%EB%93%B1+%EC%88%98%ED%95%99+4-2%282019%29%28%EC%B5%9C%EC%83%81%EC%9C%84S%29"},{"authors":["이룸이앤비 편집부"],"contents":"- 독자대상 : 중학교 1학년 - 구성 : 핵심 이론 + 문제 - 특징 : ① 개념을 묻고 답하면서 쉽게 이해하는 자기주도 학습서 ② 기본에서 심화까지 내신대비에 필요한 폭넓은 문제 구성 ③ 문제 속 숨은 뜻까지 자세히 설명해 주는 친절한 해설","datetime":"2017-07-15T00:00:00.000+09:00","isbn":"8959904163 9788959904167","price":15000,"publisher":"이룸이앤비","sale_price":13500,"status":"정상판매","thumbnail":"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F815887%3Ftimestamp%3D20190215130308","title":"중학 수학 중1(상) 개념기본서(2019)(숨마쿰라우데)","translators":[],"url":"https://search.daum.net/search?w=bookpage\u0026bookId=815887\u0026q=%EC%A4%91%ED%95%99+%EC%88%98%ED%95%99+%EC%A4%911%28%EC%83%81%29+%EA%B0%9C%EB%85%90%EA%B8%B0%EB%B3%B8%EC%84%9C%282019%29%28%EC%88%A8%EB%A7%88%EC%BF%B0%EB%9D%BC%EC%9A%B0%EB%8D%B0%29"}],"meta":{"is_end":false,"pageable_count":991,"total_count":1644}};

$(".searchBookBtn").on("click",function(e){
	getBookService.getBookData(bookData, function(result){
		alert(result);
	});
});

 function makeBookTable(bookData){
	 let option = [
 	    {field:"isbn", width:100},
 	    {field:"title",      width:200},
 	    {field:"authors", width:100},
 	    {field:"translators", width:100},
 	    {field:"publisher", width:100},
 	    {field:"datetime",   width:100},
 	    {field:"price", width:100},
 	    {field:"sale_price", width:100},
 	    {field:"contents", width:100},
 	    {field:"thumbnail", width:100},
 	    {field:"url", width:100},
 	    {field:"status", width:100}
 	];

	 
	 // spread json object to table 
 	var getBookTable = $("#getBookTable");
 	var table = $("<table>").appendTo(getBookTable);
 	$.each( bookData.documents, function( index, row) {
		var tr = $("<tr>").appendTo(table);
		$.each( option, function( i, fieldInfo ) {
			var td = $("<td>").appendTo(tr);
			td.html( row[fieldInfo.field]);
 	    });
 	});
 }
 
</script>
</body>
</html>
