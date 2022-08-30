-- 계정
CREATE USER MEALKIT IDENTIFIED BY MEALKIT;
GRANT CONNECT, RESOURCE TO MEALKIT;

-- 스키마
/* 상품 */
CREATE TABLE Product (
	pId NUMBER NOT NULL, /* 상품번호 */
	typeCode VARCHAR2(20) NOT NULL, /* 분류코드 */
	pName VARCHAR2(100) NOT NULL, /* 상품명 */
	price NUMBER NOT NULL, /* 단가 */
	brand VARCHAR2(100) NOT NULL, /* 브랜드 */
	description VARCHAR2(300), /* 상세설명 */
	thumbnail VARCHAR2(300), /* 썸네일 */
	image VARCHAR2(300) /* 이미지 */
);

COMMENT ON TABLE Product IS '상품';

COMMENT ON COLUMN Product.pId IS '상품번호';

COMMENT ON COLUMN Product.typeCode IS '분류코드';

COMMENT ON COLUMN Product.pName IS '상품명';

COMMENT ON COLUMN Product.price IS '단가';

COMMENT ON COLUMN Product.brand IS '브랜드';

COMMENT ON COLUMN Product.description IS '상세설명';

COMMENT ON COLUMN Product.thumbnail IS '썸네일';

COMMENT ON COLUMN Product.image IS '이미지';

CREATE UNIQUE INDEX PK_Product
	ON Product (
		pId ASC
	);

ALTER TABLE Product
	ADD
		CONSTRAINT PK_Product
		PRIMARY KEY (
			pId
		);

/* 상품 분류 */
CREATE TABLE Producttype (
	typeCode VARCHAR2(20) NOT NULL, /* 분류코드 */
	tName VARCHAR2(30) NOT NULL, /* 분류명 */
	tNameEng VARCHAR2(30) NOT NULL /* 분류명영문 */
);

COMMENT ON TABLE Producttype IS '상품 분류';

COMMENT ON COLUMN Producttype.typeCode IS '분류코드';

COMMENT ON COLUMN Producttype.tName IS '분류명';

COMMENT ON COLUMN Producttype.tNameEng IS '분류명영문';

CREATE UNIQUE INDEX PK_Producttype
	ON Producttype (
		typeCode ASC
	);

ALTER TABLE Producttype
	ADD
		CONSTRAINT PK_Producttype
		PRIMARY KEY (
			typeCode
		);

/* 포인트 */
CREATE TABLE Point (
	mId VARCHAR2(30) NOT NULL, /* ID */
	currentPoint NUMBER DEFAULT 0 NOT NULL, /* 포인트 */
	updateDate DATE NOT NULL /* 변동일 */
);

COMMENT ON TABLE Point IS '포인트';

COMMENT ON COLUMN Point.mId IS 'ID';

COMMENT ON COLUMN Point.currentPoint IS '현재 포인트';

COMMENT ON COLUMN Point.updateDate IS '포인트 변동 일자(적립 / 사용)';

CREATE UNIQUE INDEX PK_Point
	ON Point (
		mId ASC
	);

ALTER TABLE Point
	ADD
		CONSTRAINT PK_Point
		PRIMARY KEY (
			mId
		);

/* 회원관리 */
CREATE TABLE Member (
	mNo NUMBER NOT NULL, /* 회원번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pw VARCHAR2(50) NOT NULL, /* 비밀번호 */
	mName VARCHAR2(20) NOT NULL, /* 이름 */
	phone VARCHAR2(20), /* 전화번호 */
	address VARCHAR2(200), /* 주소 */
	email VARCHAR2(100) NOT NULL, /* 이메일 */
	regDate DATE, /* 가입일 */
	mLevel NUMBER DEFAULT 1 /* 회원등급 */
);

COMMENT ON TABLE Member IS '회원관리';

COMMENT ON COLUMN Member.mNo IS '회원고유번호';

COMMENT ON COLUMN Member.mId IS '아이디';

COMMENT ON COLUMN Member.pw IS '비밀번호';

COMMENT ON COLUMN Member.mName IS '가입자명';

COMMENT ON COLUMN Member.phone IS '연락처';

COMMENT ON COLUMN Member.address IS '(택배받을)주소';

COMMENT ON COLUMN Member.email IS '이메일';

COMMENT ON COLUMN Member.regDate IS '가입일';

COMMENT ON COLUMN Member.mLevel IS '회원권한(예: 0:비회원 1:회원 2:운영자)';

CREATE UNIQUE INDEX PK_Member
	ON Member (
		mId ASC
	);

ALTER TABLE Member
	ADD
		CONSTRAINT PK_Member
		PRIMARY KEY (
			mId
		);

/* 문의게시판 */
CREATE TABLE Qna (
	qNo NUMBER NOT NULL, /* 문의게시판 번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER NOT NULL, /* 상품번호 */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	titlePw NUMBER NOT NULL, /* 제목 비밀번호 */
	content VARCHAR2(1000) NOT NULL, /* 내용 */
	regDate DATE NOT NULL, /* 게시글 등록일 */
	count NUMBER NOT NULL /* 조회수 */
);

COMMENT ON TABLE Qna IS '문의게시판';

COMMENT ON COLUMN Qna.qNo IS '문의게시판 번호';

COMMENT ON COLUMN Qna.mId IS 'ID';

COMMENT ON COLUMN Qna.pId IS '상품번호';

COMMENT ON COLUMN Qna.title IS '제목';

COMMENT ON COLUMN Qna.titlePw IS '제목 비밀번호';

COMMENT ON COLUMN Qna.content IS '내용';

COMMENT ON COLUMN Qna.regDate IS '게시글 등록일';

COMMENT ON COLUMN Qna.count IS '조회수';

CREATE UNIQUE INDEX PK_Qna
	ON Qna (
		qNo ASC
	);

ALTER TABLE Qna
	ADD
		CONSTRAINT PK_Qna
		PRIMARY KEY (
			qNo
		);

/* 리뷰게시판 */
CREATE TABLE Review (
	rNo NUMBER NOT NULL, /* 리뷰번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER NOT NULL, /* 상품번호 */
	content VARCHAR2(1000) NOT NULL, /* 리뷰 내용 */
	regDate DATE NOT NULL /* 리뷰 작성일 */
);

COMMENT ON TABLE Review IS '리뷰게시판';

COMMENT ON COLUMN Review.rNo IS '리뷰번호';

COMMENT ON COLUMN Review.mId IS 'ID';

COMMENT ON COLUMN Review.pId IS '상품번호';

COMMENT ON COLUMN Review.content IS '리뷰 내용';

COMMENT ON COLUMN Review.regDate IS '리뷰 작성일';

CREATE UNIQUE INDEX PK_Review
	ON Review (
		rNo ASC
	);

ALTER TABLE Review
	ADD
		CONSTRAINT PK_Review
		PRIMARY KEY (
			rNo
		);

/* 문의게시판 댓글 */
CREATE TABLE Qnacomment (
	qcNo NUMBER NOT NULL, /* 문의게시판 댓글번호 */
	qNo NUMBER NOT NULL, /* 문의게시판 번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER, /* 상품번호 */
	regDate DATE NOT NULL, /* 댓글 작성일 */
	content VARCHAR2(1000) NOT NULL /* 댓글 내용 */
);

COMMENT ON TABLE Qnacomment IS '문의게시판 댓글';

COMMENT ON COLUMN Qnacomment.qcNo IS '문의게시판 댓글번호';

COMMENT ON COLUMN Qnacomment.qNo IS '문의게시판 번호';

COMMENT ON COLUMN Qnacomment.mId IS 'ID';

COMMENT ON COLUMN Qnacomment.pId IS '상품번호';

COMMENT ON COLUMN Qnacomment.regDate IS '댓글 작성일';

COMMENT ON COLUMN Qnacomment.content IS '댓글 내용';

CREATE UNIQUE INDEX PK_Qnacomment
	ON Qnacomment (
		qcNo ASC,
		qNo ASC
	);

ALTER TABLE Qnacomment
	ADD
		CONSTRAINT PK_Qnacomment
		PRIMARY KEY (
			qcNo,
			qNo
		);

/* 리뷰게시판 댓글 */
CREATE TABLE Reviewcomment (
	rcNo NUMBER NOT NULL, /* 리뷰댓글번호 */
	rNo NUMBER NOT NULL, /* 리뷰번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER, /* 상품번호 */
	regDate DATE NOT NULL, /* 댓글 작성일 */
	content VARCHAR2(1000) NOT NULL /* 댓글 내용 */
);

COMMENT ON TABLE Reviewcomment IS '리뷰게시판 댓글';

COMMENT ON COLUMN Reviewcomment.rcNo IS '리뷰댓글번호';

COMMENT ON COLUMN Reviewcomment.rNo IS '리뷰번호';

COMMENT ON COLUMN Reviewcomment.mId IS 'ID';

COMMENT ON COLUMN Reviewcomment.pId IS '상품번호';

COMMENT ON COLUMN Reviewcomment.regDate IS '댓글 작성일';

COMMENT ON COLUMN Reviewcomment.content IS '댓글 내용';

CREATE UNIQUE INDEX PK_Reviewcomment
	ON Reviewcomment (
		rcNo ASC,
		rNo ASC
	);

ALTER TABLE Reviewcomment
	ADD
		CONSTRAINT PK_Reviewcomment
		PRIMARY KEY (
			rcNo,
			rNo
		);

/* 커뮤니티 게시판 */
CREATE TABLE Community (
	cNo NUMBER NOT NULL, /* 번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	mLevel NUMBER, /* 회원등급 */
	title VARCHAR2(100) NOT NULL, /* 제목 */
	content VARCHAR2(1000) NOT NULL, /* 내용 */
	regDate DATE DEFAULT SYSDATE NOT NULL /* 작성일 */
);

COMMENT ON TABLE Community IS '커뮤니티 게시판';

COMMENT ON COLUMN Community.cNo IS '번호';

COMMENT ON COLUMN Community.mId IS 'ID';

COMMENT ON COLUMN Community.mLevel IS '회원등급';

COMMENT ON COLUMN Community.title IS '제목';

COMMENT ON COLUMN Community.content IS '내용';

COMMENT ON COLUMN Community.regDate IS '작성일';

CREATE UNIQUE INDEX PK_Community
	ON Community (
		cNo ASC
	);

ALTER TABLE Community
	ADD
		CONSTRAINT PK_Community
		PRIMARY KEY (
			cNo
		);

/* 공지사항 게시판 */
CREATE TABLE Notice (
	nNo NUMBER NOT NULL, /* 공지사항 번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	title VARCHAR2(100) NOT NULL, /* 공지사항 제목 */
	content VARCHAR2(1000) NOT NULL, /* 공지사항 내용 */
	regDate DATE NOT NULL /* 공지사항 작성일 */
);

COMMENT ON TABLE Notice IS '공지사항 게시판';

COMMENT ON COLUMN Notice.nNo IS '공지사항 번호';

COMMENT ON COLUMN Notice.mId IS 'ID';

COMMENT ON COLUMN Notice.title IS '공지사항 제목';

COMMENT ON COLUMN Notice.content IS '공지사항 내용';

COMMENT ON COLUMN Notice.regDate IS '공지사항 작성일';

CREATE UNIQUE INDEX PK_Notice
	ON Notice (
		nNo ASC,
		mId ASC
	);

ALTER TABLE Notice
	ADD
		CONSTRAINT PK_Notice
		PRIMARY KEY (
			nNo,
			mId
		);

/* 회원 장바구니 */
CREATE TABLE Usercart (
	ucId NUMBER NOT NULL, /* 장바구니번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER NOT NULL, /* 상품번호 */
	cquantity NUMBER /* 상품수량 */
);

COMMENT ON TABLE Usercart IS '회원 장바구니';

COMMENT ON COLUMN Usercart.ucId IS '장바구니번호';

COMMENT ON COLUMN Usercart.mId IS 'ID';

COMMENT ON COLUMN Usercart.pId IS '상품번호';

COMMENT ON COLUMN Usercart.cquantity IS '상품수량';

CREATE UNIQUE INDEX PK_Usercart
	ON Usercart (
		ucId ASC
	);

ALTER TABLE Usercart
	ADD
		CONSTRAINT PK_Usercart
		PRIMARY KEY (
			ucId
		);

/* 회원 주문 */
CREATE TABLE Userorder (
	oId NUMBER NOT NULL, /* 주문번호 */
	mId VARCHAR2(30) NOT NULL, /* ID */
	pId NUMBER NOT NULL, /* 상품번호 */
	quantity NUMBER NOT NULL, /* 상품수량 */
	oDate DATE, /* 주문날짜 */
	price NUMBER, /* 가격 */
	statusCode VARCHAR2(20) NOT NULL /* 상태코드 */
);

COMMENT ON TABLE Userorder IS '회원 주문';

COMMENT ON COLUMN Userorder.oId IS '주문번호';

COMMENT ON COLUMN Userorder.mId IS 'ID';

COMMENT ON COLUMN Userorder.pId IS '상품번호';

COMMENT ON COLUMN Userorder.quantity IS '상품수량';

COMMENT ON COLUMN Userorder.oDate IS '주문날짜';

COMMENT ON COLUMN Userorder.price IS '가격';

COMMENT ON COLUMN Userorder.statusCode IS '상태코드';

CREATE UNIQUE INDEX PK_Userorder
	ON Userorder (
		oId ASC
	);

ALTER TABLE Userorder
	ADD
		CONSTRAINT PK_Userorder
		PRIMARY KEY (
			oId
		);

/* 주문상태 */
CREATE TABLE StatusType (
	statusCode VARCHAR2(20) NOT NULL, /* 상태코드 */
	statusName VARCHAR2(50) NOT NULL /* 상태명 */
);

COMMENT ON TABLE StatusType IS '주문상태';

COMMENT ON COLUMN StatusType.statusCode IS '상태코드';

COMMENT ON COLUMN StatusType.statusName IS '상태명';

CREATE UNIQUE INDEX PK_StatusType
	ON StatusType (
		statusCode ASC
	);

ALTER TABLE StatusType
	ADD
		CONSTRAINT PK_StatusType
		PRIMARY KEY (
			statusCode
		);

/* 리뷰게시판 첨부 */
CREATE TABLE filename_tbl (
	rNo NUMBER, /* 리뷰번호 */
	savedfilename VARCHAR2(1000) /* 저장파일명 */
);

COMMENT ON TABLE filename_tbl IS '리뷰게시판 첨부';

COMMENT ON COLUMN filename_tbl.rNo IS '리뷰번호';

COMMENT ON COLUMN filename_tbl.savedfilename IS '저장파일명';

/* 커뮤니티게시판 첨부 */
CREATE TABLE Community_file (
	file_no NUMBER NOT NULL, /* 파일 번호 */
	cNo NUMBER NOT NULL, /* 게시판 번호 */
	org_file_name VARCHAR2(260) NOT NULL, /* 원본 파일 이름 */
	stored_file_name VARCHAR2(36) NOT NULL, /* 변경된 파일 이름 */
	file_size NUMBER, /* 파일 크기 */
	regDate DATE DEFAULT SYSDATE NOT NULL, /* 파일등록일 */
	del_gb VARCHAR2(1)  DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE Community_file IS '커뮤니티게시판 첨부';

COMMENT ON COLUMN Community_file.file_no IS '파일 번호';

COMMENT ON COLUMN Community_file.cNo IS '게시판 번호';

COMMENT ON COLUMN Community_file.org_file_name IS '원본 파일 이름';

COMMENT ON COLUMN Community_file.stored_file_name IS '변경된 파일 이름';

COMMENT ON COLUMN Community_file.file_size IS '파일 크기';

COMMENT ON COLUMN Community_file.regDate IS '파일등록일';

COMMENT ON COLUMN Community_file.del_gb IS '삭제구분';

CREATE UNIQUE INDEX PK_Community_file
	ON Community_file (
		file_no ASC
	);

ALTER TABLE Community_file
	ADD
		CONSTRAINT PK_Community_file
		PRIMARY KEY (
			file_no
		);

ALTER TABLE Product
	ADD
		CONSTRAINT FK_Producttype_TO_Product
		FOREIGN KEY (
			typeCode
		)
		REFERENCES Producttype (
			typeCode
		);

ALTER TABLE Point
	ADD
		CONSTRAINT FK_Member_TO_Point
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		)
		ON DELETE CASCADE;

ALTER TABLE Qna
	ADD
		CONSTRAINT FK_Product_TO_Qna
		FOREIGN KEY (
			pId
		)
		REFERENCES Product (
			pId
		);

ALTER TABLE Qna
	ADD
		CONSTRAINT FK_Member_TO_Qna
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_Product_TO_Review
		FOREIGN KEY (
			pId
		)
		REFERENCES Product (
			pId
		);

ALTER TABLE Review
	ADD
		CONSTRAINT FK_Member_TO_Review
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Qnacomment
	ADD
		CONSTRAINT FK_Qna_TO_Qnacomment
		FOREIGN KEY (
			qNo
		)
		REFERENCES Qna (
			qNo
		);

ALTER TABLE Qnacomment
	ADD
		CONSTRAINT FK_Member_TO_Qnacomment
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Reviewcomment
	ADD
		CONSTRAINT FK_Review_TO_Reviewcomment
		FOREIGN KEY (
			rNo
		)
		REFERENCES Review (
			rNo
		);

ALTER TABLE Reviewcomment
	ADD
		CONSTRAINT FK_Member_TO_Reviewcomment
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Community
	ADD
		CONSTRAINT FK_Member_TO_Community
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Notice
	ADD
		CONSTRAINT FK_Member_TO_Notice
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Usercart
	ADD
		CONSTRAINT FK_Member_TO_Usercart
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Usercart
	ADD
		CONSTRAINT FK_Product_TO_Usercart
		FOREIGN KEY (
			pId
		)
		REFERENCES Product (
			pId
		);

ALTER TABLE Userorder
	ADD
		CONSTRAINT FK_Member_TO_Userorder
		FOREIGN KEY (
			mId
		)
		REFERENCES Member (
			mId
		);

ALTER TABLE Userorder
	ADD
		CONSTRAINT FK_Product_TO_Userorder
		FOREIGN KEY (
			pId
		)
		REFERENCES Product (
			pId
		);

ALTER TABLE Userorder
	ADD
		CONSTRAINT FK_StatusType_TO_Userorder
		FOREIGN KEY (
			statusCode
		)
		REFERENCES StatusType (
			statusCode
		);

ALTER TABLE Community_file
	ADD
		CONSTRAINT FK_Community_TO_Community_file
		FOREIGN KEY (
			cNo
		)
		REFERENCES Community (
			cNo
		);



/* 시퀀스, 트리거, 샘플 데이터 */
--PRODUCTTYPE
INSERT INTO PRODUCTTYPE VALUES('1', '한식', 'Korean food');
INSERT INTO PRODUCTTYPE VALUES('2', '양식', 'Western Food');
INSERT INTO PRODUCTTYPE VALUES('3', '중식', 'Chinese Food');
INSERT INTO PRODUCTTYPE VALUES('4', '일식', 'Japanese Food');
INSERT INTO PRODUCTTYPE VALUES('5', '기타', 'etc');

--PRODUCT
--DROP SEQUENCE pIdSeq;
CREATE SEQUENCE pIdSeq
START WITH 1
INCREMENT BY 1;

--MEMBER
--DROP SEQUENCE MNO_SEQ;
CREATE SEQUENCE MNO_SEQ
START WITH 1
INCREMENT BY 1;
-- 관리자 계정 생성 ID:admin PW:1111
INSERT INTO MEMBER(MNO, MID, PW, MNAME, EMAIL, REGDATE, MLEVEL)
    VALUES(MNO_SEQ.nextval, 'admin', '1111', '관리자', 'kh361@naver.com', sysdate, 2);
-- 관리자 계정 포인트 생성
INSERT INTO POINT 
    VALUES('admin', 999999999, sysdate);

--CART
--DROP SEQUENCE UCIDSEQ;
CREATE SEQUENCE UCIDSEQ
START WITH 1
INCREMENT BY 1;

--STATUSTYPE
INSERT INTO StatusType Values ('1','주문 확인');
INSERT INTO StatusType Values ('2','상품 준비 중');
INSERT INTO StatusType Values ('3','배송 준비 중');
INSERT INTO StatusType Values ('4','배송 중');
INSERT INTO StatusType Values ('5','배송 완료');
INSERT INTO StatusType Values ('6','주문 취소');
INSERT INTO StatusType Values ('7','반품 처리');
INSERT INTO StatusType Values ('8','교환 처리');

--USERORDER
--DROP SEQUENCE oId_SEQ;
CREATE SEQUENCE oId_SEQ
START WITH 1
INCREMENT BY 1;

--COMMUNITY
--DROP SEQUENCE Community_seq;
CREATE SEQUENCE Community_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100
CYCLE NOCACHE;
--DROP SEQUENCE SEQ_COMMUNITY_FILE_NO;
CREATE SEQUENCE SEQ_COMMUNITY_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;   

--REVIEW
--DROP SEQUENCE review_rno_seq;
create sequence review_rno_seq start with 1;
create or replace trigger review_trg
before insert
on review for each row
begin
select review_rno_seq.nextval
into :new.rNo
from dual;
end;