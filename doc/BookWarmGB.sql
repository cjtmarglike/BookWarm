--------------- user ---------------(������)
create table user_info(
user_id varchar2(20),
user_pw varchar2(64) not null,
user_nickname varchar2(20) not null,
user_name varchar2(20) not null,
user_bday date not null,
user_sex char(1) not null,
user_phone varchar2(20) not null,
user_mail varchar2(50) not null,
user_zipcode number(10,0) not null,
user_addr varchar2(100) not null,
user_addr_detail varchar2(100),
user_join_date date default sysdate,
user_level number(1) default '1',
user_tot_price number(15,0),
user_point number(10,0),
constraint pk_user_info primary key(user_id)
);                     
-------------------- book --------------------

create table book(
isbn varchar2(20),
book_title varchar2(200) not null,
writer_name varchar2(100)  not null,
translator_name varchar2(100),
publisher_name varchar2(100) not null,
book_tot_page number(10,0) default 1000,
book_published_date DATE,
book_price number(10,0),
book_price_for_sale number(10,0),
book_stock varchar2(15),
book_story varchar2(500),
book_img varchar2(100),
constraint pk_book primary key(isbn)
);

--------------- ���ڸ� --------------- 
create table authors (
isbn varchar2(20) not null,
author varchar2(100) not null,
constraint fk_authors FOREIGN KEY(isbn)
           REFERENCES book(isbn)           
);

--------------- ���ڸ� --------------- 
create table translators (
isbn varchar2(20) not null,
translator varchar2(100) not null,
constraint fk_translators FOREIGN KEY(isbn)
           REFERENCES book(isbn)           
);

--------------- å�� ���� �۱� ---------------
create table book_clause(
isbn varchar2(20) not null,
clause varchar2(300) not null,
constraint fk_book_clause FOREIGN KEY(isbn)
           REFERENCES book(isbn)
);

------------------�� ����------------------------------------

create table library(
user_id varchar2(20) not null,
list_no number(10,0) default 1,
list_img_src varchar2(100),
list_type varchar2(10) default 'basic',
isbn varchar2(20) not null,
list_added_date date default sysdate,
constraint fk_library FOREIGN KEY(user_id)
           REFERENCES user_info(user_id)
);

-------------------- create log, loging board --------------------

-- logBoard, logingBoard sequence ����
create sequence seq_logingBoard;

-- logingBoard ���� ����(���)
create table loging_board(
isbn varchar2(20) not null,
user_id VARCHAR2(20) not null,
write_no number(10,0),
start_page number(10,0) default 1 not null,
end_page number(10,0) not null,
start_date date default sysdate,
end_date varchar2(10) default 'false',
constraint pk_loging_board primary key(write_no),
constraint fk_loging_board FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);

create table book_star (
isbn varchar2(20) not null,
user_id VARCHAR2(20) not null,
star number(2,0) not null,
constraint fk_book_star_isbn FOREIGN KEY(isbn)
                REFERENCES book(isbn),
constraint fk_book_star_user_id FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);


--�����������̺� �����ȣ ������
create sequence review_board_seq;

--�������� ���̺� (���ض�)
create table review_board(
review_no  NUMBER (10,0),
user_id VARCHAR2(20) not null,
review_written_date date default sysdate,
review_modify_date date default sysdate,
isbn varchar2(20) not null,
review_ref number(10,0),
review_title varchar2(200) not null,
review_content varchar2(2000) not null,
review_open varchar2(7),
constraint pk_review_board primary key(review_no),
constraint fk_review_board FOREIGN KEY(user_id)
                REFERENCES user_info(user_id)
);

----���
create sequence review_comment_seq;

----��� ���̺� (���ض�)(9/5 review_reply -> review_comment�� ����)
create table review_comment(
    review_cmt_no number(10,0),
    review_no number(10,0) not null,
    user_id varchar2(20) not null,
    review_cmt_content varchar2(200) not null,
    review_cmt_written_date date default sysdate,
    review_cmt_modified_date date default sysdate,
    CONSTRAINT pk_review_comment primary key (review_cmt_no),
    constraint fk_review_comment FOREIGN KEY(review_no)
               REFERENCES review_board(review_no)
);
create index idx_review_comment on review_comment(review_no desc, review_cmt_no asc);


--����÷��(���ض�)
create table review_attach(
    uuid varchar2(100),
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    review_no number(10,0) not null,
    constraint pk_review_attach primary key(uuid),
    constraint fk_review_attach FOREIGN KEY(review_no)
               REFERENCES review_board(review_no)
);


--�ؽ��±� ������
create sequence hashtag_seq;

--�ؽ��±� ���̺� (���ض� ��� ���� - ����)
create table hashtag(
review_no number(10,0) not null,
tag_name varchar2(50) not null,
constraint fk_hashtag FOREIGN KEY(review_no)
           REFERENCES review_board(review_no)
);


-------------------- create community board --------------------

--community board (�ڱ��) (9/6 �÷� ũ��, pk�̸� ����)
create table community_board(
comm_no NUMBER(10,0),
user_id VARCHAR2(20) not null,
comm_subject varchar2(30),
comm_title VARCHAR2(200) not null,
comm_content VARCHAR2(2000) not null,
comm_written_time DATE DEFAULT SYSDATE,
comm_modify_time DATE DEFAULT SYSDATE,
comm_clicked NUMBER(10,0) DEFAULT 0,
comm_group NUMBER(10,0),
comm_step NUMBER(10,0),
comm_indent NUMBER(10,0),
constraint pk_community_board primary key(comm_no)
);

--comunity board sequence
create sequence community_board_seq;
create sequence community_board_comment_seq;

-- community_board_comment table (�ڱ��)
create table community_board_comment(
comm_no number(10,0) not null,
comm_cmt_no NUMBER(10,0),
user_id VARCHAR2(20) not null,
comm_cmt_content VARCHAR2(2000) not null,
comm_cmt_written_time DATE DEFAULT SYSDATE,
comm_cmt_modify_time DATE DEFAULT SYSDATE,
comm_cmt_deleted char(1) default 'n',
comm_cmt_group NUMBER(10,0),
comm_cmt_step NUMBER(10,0),
comm_cmt_indent NUMBER(10,0),
constraint pk_community_board_comment primary key(comm_cmt_no),
constraint fk_community_board_comment FOREIGN KEY(comm_no)
           REFERENCES community_board(comm_no)
);

-- community Board Comment Index
create index idx_comm_cmt on community_board_comment (comm_no desc, comm_cmt_no asc);
 
---------------------------------------------------------------

--ģ��
create table friend(
user_id varchar2(20) not null,
friend_id varchar2(20) not null,
constraint fk_friend_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id),
constraint fk_friend_friend_id FOREIGN KEY(friend_id)
           REFERENCES user_info(user_id)
);


--�޽��� ���
create sequence msg_seq;

create table msg_table(
msg_no number(10,0),
msg_send_id varchar2(20) not null,
msg_get_id varchar2(20) not null,
msg_title varchar2(200) not null,
msg_content varchar2(2000) not null,
msg_send_time date default sysdate,
msg_read_time date default sysdate,
constraint pk_msg_table primary key(msg_no),
constraint fk_msg_table_send_id FOREIGN KEY(msg_send_id)
           REFERENCES user_info(user_id),
constraint fk_msg_table_get_id FOREIGN KEY(msg_get_id)
           REFERENCES user_info(user_id)
);


--����
create table coupon(
coupon_no varchar2(15),
coupon_name varchar2(20) not null,
coupon_req number(1),
coupon_use_req number(6),
coupon_discount_percent number(10,0),
coupon_validate date not null,
constraint pk_coupon primary key(coupon_no)
);


--���� ����
create table coupon_no(
coupon_no varchar2(15) not null,
user_id varchar2(20) not null,
coupon_available char(1) default 'y',
constraint fk_coupon_no_coupon_no FOREIGN KEY(coupon_no)
           REFERENCES coupon(coupon_no),
constraint fk_coupon_no_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id)
);


--����
create table pay(
pay_no varchar2(20),
pay_way varchar2(20) not null,
pay_total number(10,0) not null,
pay_refund_account varchar2(50) not null,
constraint pk_pay primary key(pay_no)
);

create SEQUENCE pay_seq;

--�ֹ�
create sequence orders_seq;
create table orders(
orders_no varchar2(20),
user_id varchar2(20) not null,
orders_date date not null,
isbn varchar2(20) not null,
orders_cnt number(10,0) not null,
orders_tot number(10,0) not null,
orders_start_date date not null,
orders_pay_date date not null,
coupon_no varchar2(20),
post_no varchar2(20),
pay_no varchar2(20) not null,
orders_status varchar2(10),
constraint pk_orders primary key(orders_no),
constraint fk_orders_pay_no FOREIGN KEY(pay_no)
           REFERENCES pay(pay_no)
);
-- cf. �ֹ� ���̺� fk�� �� ���� �� �־� fk_���̺��_�÷��� ���� fk ���.


--------------- cart ---------------(������)

create table cart(
cart_no number(20),
user_id varchar2(20) not null, -- fk �����ϱ�
isbn varchar2(20) not null, --fk�����ϱ�
cart_cnt number(20),
constraint pk_cart primary key(cart_no),
constraint fk_cart_user_id FOREIGN KEY(user_id)
           REFERENCES user_info(user_id),
constraint fk_cart_isbn FOREIGN KEY(isbn)
           REFERENCES book(isbn)
);

-- cart_no ������
create sequence CART_SEQ;


--------------- å���� ���ϴ� �޸𺸵� ---------------

-- �޸𺸵� ������ ����
create sequence memo_board_seq;
create sequence book_reply_seq;

CREATE TABLE memo_board(
memo_no number(10,0),
user_id varchar2(20) not null,
memo_content_b varchar(2000) not null,
memo_written_time date default sysdate,
memo_modify_time date default sysdate,
constraint pk_memo_board primary key(memo_no)
);

--�޸𺸵� å ���
CREATE TABLE memo_comment(
memo_cmt_no number(10,0),
memo_no number(10,0) not null, -- fk �����ϱ�
user_id varchar2(20) not null,
isbn varchar2(20) not null,
memo_cmt_content varchar(200) not null,
memo_cmt_written_time date default sysdate,
memo_cmt_modify_time date default sysdate,
memo_cmt_like number(10,0) default 0,
constraint pk_memo_comment primary key(memo_cmt_no),
constraint fk_memo_comment FOREIGN KEY(memo_no)
           REFERENCES memo_board(memo_no)
);


------------------------------ MD��õ (ť���̼�) ------------------------------
create sequence curation_seq;

create table curation (
curation_no number(10),
curation_name varchar2(20) not null,
isbn varchar2(20) not null,
constraint pk_curation primary key(curation_no)
);

                
                
                
                
                
                
                
                
                
                
-------------------------sample data--------------------------------------------------

-- book ���̺� sample data
insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('1','å1','�۰�1','���ǻ�1','3000',50, '/warm/resources/img/isbn_img/book1.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('2','å2','�۰�2','���ǻ�2','5000',20, '/warm/resources/img/isbn_img/book2.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('3','å3','�۰�3','���ǻ�3','4500', 25, '/warm/resources/img/isbn_img/book3.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('4','å4','�۰�4','���ǻ�4','10000',37, '/warm/resources/img/isbn_img/book4.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('5','å5','�۰�5','���ǻ�5','6500',50, '/warm/resources/img/isbn_img/book5.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('6','å6','�۰�6','���ǻ�6','7000',23, '/warm/resources/img/isbn_img/book6.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('7','å7','�۰�7','���ǻ�7','5000',51, '/warm/resources/img/isbn_img/book7.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('8','å8','�۰�8','���ǻ�8','6900',80, '/warm/resources/img/isbn_img/book8.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('9','å9','�۰�9','���ǻ�9','8200',44, '/warm/resources/img/isbn_img/book9.jpg');

insert into book(isbn, book_title, writer_name, publisher_name, book_price_for_sale, book_stock, book_img)
values('10','å10','�۰�10','���ǻ�10','3100',50, '/warm/resources/img/isbn_img/book10.jpg');

commit;


-- user_info ���̺� sample data(����)

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('aaa','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user1','����1',TO_DATE('1994-12-31'),'f', '010-1231-1231', 'aaa@naver.com', 12345, '����Ư���� �������� ����1��',0,1000, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('bbb','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user2','����2',TO_DATE('1994-1-3'),'f', '010-1231-1232', 'bbb@naver.com', 12312, '����Ư���� �������� ����2��',0,500, 2, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ccc','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user3','����3',TO_DATE('1994-2-20'),'m', '010-1211-1231', 'ccc@naver.com', 12245, '����Ư���� �������� ��굿1��',0,700, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ddd','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user4','����4',TO_DATE('1994-8-3'),'f', '010-1111-1231', 'ddd@naver.com', 11145, '����Ư���� �������� ������5��',0,20000, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('eee','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user5','����5',TO_DATE('1994-4-5'),'m', '010-1212-1111', 'eee@naver.com', 55555, '����Ư���� �������� ����5��',0,2000, 3, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('fff','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user6','����6',TO_DATE('1994-2-20'),'m', '010-2222-1231', 'fff@naver.com', 12333, '����Ư���� �������� ������1��',0,500, 2, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('ggg','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user7','����7',TO_DATE('1994-2-24'),'m', '010-2822-1231', 'ggg@naver.com', 15133, '����Ư���� �������� ��������1��',0,1000, 3, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('hhh','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user8','����8',TO_DATE('1994-9-27'),'f', '010-2022-1231', 'hhh@naver.com', 12333, '����Ư���� �������� ������1��',0,0, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('iii','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user9','����9',TO_DATE('1994-9-20'),'m', '010-2113-1231', 'iii@naver.com', 15133, '����Ư���� �������� ��������1��',0,0, 1, sysdate);

insert into user_info(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_BDAY, USER_SEX, USER_PHONE, USER_MAIL, USER_ZIPCODE, USER_ADDR, USER_TOT_PRICE, USER_POINT, USER_LEVEL, USER_JOIN_DATE)
values('jjj','932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef','user10','����10',TO_DATE('1984-9-20'),'m', '010-2183-1231', 'jjj@naver.com', 15133, '����Ư���� �������� ��������1��',0,0, 1, sysdate);

commit;

-- cart ���̺� sample data
insert into cart
values(CART_SEQ.nextval, 'aaa', '1', 30);

insert into cart
values(CART_SEQ.nextval, 'aaa', '5', 10);

insert into cart
values(CART_SEQ.nextval, 'aaa', '6', 4);

insert into cart
values(CART_SEQ.nextval, 'aaa', '4', 2);

insert into cart
values(CART_SEQ.nextval, 'bbb', '2', 7);

insert into cart
values(CART_SEQ.nextval, 'bbb', '3', 5);

insert into cart
values(CART_SEQ.nextval, 'ccc', '1', 8);

insert into cart
values(CART_SEQ.nextval, 'ddd', '4', 11);

insert into cart
values(CART_SEQ.nextval, 'ddd', '5', 3);

insert into cart
values(CART_SEQ.nextval, 'ddd', '6', 2);

commit;

-------------------���� book test ������--------------------------------
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(111111, '������ ����', '�迵��', '���е���', 300, '2019/05/31', 13500, 9500, 100, '�߹�� �ֹ�,��ó�� ���� ����� ���ǵ�κ��� �޾Ƴ���,���� ����',
        './resources/VertexEx/img/shop/1.jpg');
        
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(222222, '�뵵���� �����', '�ڻ�', 'â��', 300, '2019/07/24', 14000, 9800, 100, '������, ���� �Ƹ��ٿ� ����, ��¼�� �� ������ ���� �Ҽ��� ÷��, �ڻ� ���� �Ҽ�',
        './resources/VertexEx/img/shop/2.jpg');
        
insert into book(isbn, book_title, writer_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(333333, '�������� �Ѿƻ�', '������', '����', 300, '2019/08/02', 13000, 9100, 200, 
        '���� �����ڸ����� �Ͼ ��ΰ� ����ϰ� ��, �ܰ��� ��ΰ� ������ �Ѿ��� ���� ����� ������ ��� �̾߱�!','./resources/VertexEx/img/shop/3.jpg');

insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(444444, '��', '�׵� â', '�����', '����', 300, '2019/07/01', 16500, 12000, 200, 
        '���ΰ� ���ݼ����� ��', './resources/VertexEx/img/shop/5.jpg');
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(555555, '���� ������ �ʿ��� �����ɸ���', '������', '�Ӻ���', '�ٿ�', 300, '2019/07/19', 13000, 9100, 200, '���� ������Ű�� ����� �ɸ��� 2ź',
        './resources/VertexEx/img/shop/8.jpg');
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story, book_img)
values(666666, '��ƮǮ�Ͻ�', '�ѽ� �ν���, �ö� �ν���', '��â��', '�迵��', 300, '2019/02/28', 19800, 11880, 200, 
        '�� ���� 100���� ����! ���� �����踦 ������� �۷ι� ����Ʈ���� ��ħ�� �Ⱓ!', './resources/VertexEx/img/shop/4.jpg');   
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story,  book_img)
values(777777, '�ظ� ���Ϳ� �������� ��', '����.K.�Ѹ�', '������', 'Pottermore from J.K. Rowling', 300, '2016/08/18', 10050, 10050, 200, 
        '��1�� ��Ƴ��� ����',  './resources/VertexEx/img/shop/�ظ�����1.jpg');   
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story, book_img)
values(888888, '�ظ� ���Ϳ� ������ ����', '����.K.�Ѹ�', '������', 'Pottermore from J.K. Rowling', 300, '2017/07/25', 10050, 10050, 200, 
        '�ظ� ���ͷ� ��� ���� �� �����, ��� �Ǿ�� ��Ȳ�� ũ�� �������� �ʴ´�.',   './resources/VertexEx/img/shop/�ظ�����6.jpg');  
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock,book_story,  book_img)
values(999999, '�ź��� ���� ����', '����.K.�Ѹ�', '������', 'Pottermore', 300, '2017/07/17', 10500, 10500, 200, 
        '���� ���������� ��Ʈ ��ĳ�Ǵ��� ���忡 �������� �����ص�',  './resources/VertexEx/img/shop/�ź��ѵ�������.jpg');  
        
insert into book(isbn, book_title, writer_name, translator_name, publisher_name, book_tot_page, book_published_date,
                    book_price, book_price_for_sale, book_stock, book_story,  book_img)
values(101010, '�ظ� ���Ϳ� ����� ��', '����.K.�Ѹ�', '������', 'Pottermore from J.K. Rowling', 300, '2017/07/17', 10500, 10800, 200, 
        '�� ���� �븳 �ӿ��� ����� � �ҳ��� �� ����� �������� �����س����ٴ� �������� �׸�',   './resources/VertexEx/img/shop/�ظ�����2.jpg');          


-- coupon���̺� sample data
insert into coupon values('001','����1',1,10000,5,to_date('2020-01-01'));
insert into coupon values('002','����2',1,1000,10,to_date('2020-01-01'));
insert into coupon values('003','����3',1,2000,10,to_date('2020-01-01'));
insert into coupon values('004','����4',2,3000,5,to_date('2020-01-01'));
insert into coupon values('005','����5',2,5000,10,to_date('2020-01-01'));
insert into coupon values('006','����6',2,10000,20,to_date('2020-01-01'));
insert into coupon values('007','����7',3,1000,20,to_date('2020-01-01'));
insert into coupon values('008','����8',3,5000,30,to_date('2020-01-01'));
insert into coupon values('009','����9',1,50000,20,to_date('2020-01-01'));
insert into coupon values('010','����10',1,20000,20,to_date('2020-01-01'));

-- coupon_no ���̺� sample data
insert into coupon_no values('001','aaa','t');
insert into coupon_no values('002','aaa','t');
insert into coupon_no values('003','aaa','t');
insert into coupon_no values('004','aaa','f');
insert into coupon_no values('002','bbb','t');
insert into coupon_no values('001','bbb','f');
insert into coupon_no values('009','ccc','t');
insert into coupon_no values('005','ddd','t');
insert into coupon_no values('007','ccc','t');
insert into coupon_no values('001','ddd','f');

-- community_board sample_Data
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', '���Ӹ�','��������','�ض��ض�',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', 'â�Ƿ�����','Ŀ�ǰ�����¾�ħ','�޴��� �ڹ�Ĩ���ʿ���',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin1', '���̾��̺����ִ�','�������� �ʰԿ���','����  �����Գ�',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '����������','������ ����������','ǫ ���� �����ſ�',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '��������','���� ������ �Է�','�� ���� �������ΰ�?',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '������','������ �ֱ׷�','���̳ʹ������ݾ�',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '����','�޷�>��<','ũ����������',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin3', '����¡ó��','�Ҷ����ٺ��̰�','�Խñ��� 10���β���',sysdate,sysdate,0,0,0,0);
insert into community_board values(COMMUNITY_BOARD_SEQ.nextval, 'admin2', '������','�پƾƾƺ�','Ǫ��������',sysdate,sysdate,0,0,0,0);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);
insert into community_board (COMM_NO,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT) (select COMMUNITY_BOARD_SEQ.nextval,USER_ID,COMM_SUBJECT,COMM_TITLE,COMM_CONTENT,COMM_WRITTEN_TIME,COMM_MODIFY_TIME,COMM_CLICKED,COMM_GROUP,COMM_STEP,COMM_INDENT from community_board);

--community_board_comment Sample_Data
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '��۳���',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '�����մϴ�',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '���¿�',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '������',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(1, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '������',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '���',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '������',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin2', '������',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin3', '�� ������',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment values(2, COMMUNITY_BOARD_COMMENT_SEQ.nextval,'admin1', '��� ���� �� �Խñ۸��� �� ����?',sysdate,sysdate,'n',0,0,0);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
insert into community_board_comment (COMM_NO,COMM_CMT_NO,USER_ID,COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT) (select COMMUNITY_BOARD_COMMENT_SEQ.nextval, COMMUNITY_BOARD_COMMENT_SEQ.nextval,USER_ID, COMM_CMT_CONTENT,COMM_CMT_WRITTEN_TIME,COMM_CMT_MODIFY_TIME,COMM_CMT_DELETED,COMM_CMT_GROUP,COMM_CMT_STEP,COMM_CMT_INDENT from community_board_comment);
