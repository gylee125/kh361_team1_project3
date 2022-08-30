-- 테스트용 상품샘플데이터(필요시 사용)
-- 관리자 로그인해서 직접 상품 추가해도 되지만, 다른 기능 테스트 위해 상품 데이터 필요한 경우를 위해 공유.
-- 해당 sql 폴더 내에 있는 upload폴더 c드라이브 안에 위치시키기
-- C:\upload 안에 2022, temp 폴더 있어야 함.
-- 아래 INSERT문 오라클에서 실행

INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '4', '마제소바', '15000', '일식집', '마제소바입니다.', '2022/08/17/9c10e140-beda-4749-a4aa-f3033a002b5e_sample6.png', '2022/08/17/aee5f476-0ccc-47b9-aa02-d42704d3fd2f_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '비빔국수', '7500', '죽순', '비빔국수입니다.', '2022/08/17/5f2fd7bd-5f38-4780-826e-4d4aecd72df2_sample2.png', '2022/08/17/e6f743fe-6082-4b95-877b-ee98d13cd840_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '5', '호주산 안심', '19700', '고깃집', '호주산 안심입니다.', '2022/08/17/37b2faa4-d924-45db-8a5d-1c8f3e85cf2d_sample8.png', '2022/08/17/1c6ad1aa-bad6-4825-8232-bf7bca0c30ac_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '포테이토 피자', '7500', '피자헛', '포테이토 피자입니다.', '2022/08/17/aee5cd80-815f-42a6-bb1c-bcec81232bea_sample7.png', '2022/08/17/fe42dc36-b871-4361-bd8c-7b514b9a8060_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '부대찌개', '12000', '송탄집', '부대찌개입니다.', '2022/08/18/cfefc6d1-e293-4b78-9d59-e51aa041d949_sample1.png', '2022/08/18/38d8380f-9894-47e0-ad48-68b86ccd0b2c_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '얼큰짬뽕', '13500', '짬뽕집', '얼큰한 짬뽕입니다.', '2022/08/22/b58731c0-ee9a-4bfd-b0be-d8fbb898d023_sample3.png', '2022/08/22/581f69bd-5d59-463a-9ea9-35dd7b49b0ae_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '마라탕면', '8500', '중국집', '마라탕면입니다.', '2022/08/23/6d736e77-264c-48e7-b325-4fdaa2293691_sample5.png', '2022/08/23/6841a28b-2125-4009-87f0-49cfdba8d807_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '전주쫄면', '8500', '쫄면집', '전주에서 유명한 쫄면입니다.', '2022/08/23/384835d1-5aae-4f68-8839-4c33fe279102_sample4.png', '2022/08/23/351936b4-3d88-4d66-b34f-a94d0c708795_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '로제 파스타', '15000', '양식집', '로제 파스타입니다.', '2022/08/19/da43cf5d-8f71-4141-92e1-211dca102d37_sample9.png', '2022/08/19/b33fa258-1c1f-4905-8d5b-1bc464c78abd_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '4', '마제소바', '15000', '일식집', '마제소바입니다.', '2022/08/17/9c10e140-beda-4749-a4aa-f3033a002b5e_sample6.png', '2022/08/17/aee5f476-0ccc-47b9-aa02-d42704d3fd2f_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '비빔국수', '7500', '죽순', '비빔국수입니다.', '2022/08/17/5f2fd7bd-5f38-4780-826e-4d4aecd72df2_sample2.png', '2022/08/17/e6f743fe-6082-4b95-877b-ee98d13cd840_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '5', '호주산 안심', '19700', '고깃집', '호주산 안심입니다.', '2022/08/17/37b2faa4-d924-45db-8a5d-1c8f3e85cf2d_sample8.png', '2022/08/17/1c6ad1aa-bad6-4825-8232-bf7bca0c30ac_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '포테이토 피자', '7500', '피자헛', '포테이토 피자입니다.', '2022/08/17/aee5cd80-815f-42a6-bb1c-bcec81232bea_sample7.png', '2022/08/17/fe42dc36-b871-4361-bd8c-7b514b9a8060_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '부대찌개', '12000', '송탄집', '부대찌개입니다.', '2022/08/18/cfefc6d1-e293-4b78-9d59-e51aa041d949_sample1.png', '2022/08/18/38d8380f-9894-47e0-ad48-68b86ccd0b2c_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '얼큰짬뽕', '13500', '짬뽕집', '얼큰한 짬뽕입니다.', '2022/08/22/b58731c0-ee9a-4bfd-b0be-d8fbb898d023_sample3.png', '2022/08/22/581f69bd-5d59-463a-9ea9-35dd7b49b0ae_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '마라탕면', '8500', '중국집', '마라탕면입니다.', '2022/08/23/6d736e77-264c-48e7-b325-4fdaa2293691_sample5.png', '2022/08/23/6841a28b-2125-4009-87f0-49cfdba8d807_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '전주쫄면', '8500', '쫄면집', '전주에서 유명한 쫄면입니다.', '2022/08/23/384835d1-5aae-4f68-8839-4c33fe279102_sample4.png', '2022/08/23/351936b4-3d88-4d66-b34f-a94d0c708795_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '로제 파스타', '15000', '양식집', '로제 파스타입니다.', '2022/08/19/da43cf5d-8f71-4141-92e1-211dca102d37_sample9.png', '2022/08/19/b33fa258-1c1f-4905-8d5b-1bc464c78abd_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '4', '마제소바', '15000', '일식집', '마제소바입니다.', '2022/08/17/9c10e140-beda-4749-a4aa-f3033a002b5e_sample6.png', '2022/08/17/aee5f476-0ccc-47b9-aa02-d42704d3fd2f_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '비빔국수', '7500', '죽순', '비빔국수입니다.', '2022/08/17/5f2fd7bd-5f38-4780-826e-4d4aecd72df2_sample2.png', '2022/08/17/e6f743fe-6082-4b95-877b-ee98d13cd840_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '5', '호주산 안심', '19700', '고깃집', '호주산 안심입니다.', '2022/08/17/37b2faa4-d924-45db-8a5d-1c8f3e85cf2d_sample8.png', '2022/08/17/1c6ad1aa-bad6-4825-8232-bf7bca0c30ac_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '포테이토 피자', '7500', '피자헛', '포테이토 피자입니다.', '2022/08/17/aee5cd80-815f-42a6-bb1c-bcec81232bea_sample7.png', '2022/08/17/fe42dc36-b871-4361-bd8c-7b514b9a8060_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '부대찌개', '12000', '송탄집', '부대찌개입니다.', '2022/08/18/cfefc6d1-e293-4b78-9d59-e51aa041d949_sample1.png', '2022/08/18/38d8380f-9894-47e0-ad48-68b86ccd0b2c_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '얼큰짬뽕', '13500', '짬뽕집', '얼큰한 짬뽕입니다.', '2022/08/22/b58731c0-ee9a-4bfd-b0be-d8fbb898d023_sample3.png', '2022/08/22/581f69bd-5d59-463a-9ea9-35dd7b49b0ae_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '3', '마라탕면', '8500', '중국집', '마라탕면입니다.', '2022/08/23/6d736e77-264c-48e7-b325-4fdaa2293691_sample5.png', '2022/08/23/6841a28b-2125-4009-87f0-49cfdba8d807_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '1', '전주쫄면', '8500', '쫄면집', '전주에서 유명한 쫄면입니다.', '2022/08/23/384835d1-5aae-4f68-8839-4c33fe279102_sample4.png', '2022/08/23/351936b4-3d88-4d66-b34f-a94d0c708795_sample9details.png');
INSERT INTO PRODUCT VALUES(pIdSeq.NEXTVAL, '2', '로제 파스타', '15000', '양식집', '로제 파스타입니다.', '2022/08/19/da43cf5d-8f71-4141-92e1-211dca102d37_sample9.png', '2022/08/19/b33fa258-1c1f-4905-8d5b-1bc464c78abd_sample9details.png');
commit;