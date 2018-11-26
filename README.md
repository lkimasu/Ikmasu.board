# Ikmasu.board
ajax를 이용한 스프링 mvc 게시판
# 개발 환경
●Eclispe jee Oxygen  
●Tomcat v7.0  
●jre 1.8.0_181  
●STS(Spring Tool Suite)  
●MySQL 8.0.11  
●JSDT jQuery  

# Mysql Qurey

```sql
/*테이블 생성*/
CREATE TABLE TB_BOARD
(
    IDX int(10) auto_increment PRIMARY KEY,
    TITLE VARCHAR(100) NOT NULL,
    CONTENTS VARCHAR(4000) NOT NULL,
    HIT_CNT int(11) NOT NULL,
    CREA_DTM DATE NOT NULL,
    CREA_ID VARCHAR(30) NOT NULL
);


/* DB 인코딩*/
ALTER DATABASE board DEFAULT CHARACTER SET utf8;

/* 검색 쿼리 */

SELECT * FROM TB_BOARD
where TITLE LIKE '%검색어%'

/*페이징 쿼리*/

SELECT * FROM TB_BOARD
WHERE ORDER BY IDX DESC
LIMIT 0, 10;
```
