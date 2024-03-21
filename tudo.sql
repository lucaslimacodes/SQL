REM   Script: PROJETO_DE_GDI
REM   PROJETO DE GDI

CREATE TABLE PLAYER(  --CRIANDO TABELA PLAYER 
COIN NUMBER(4) NOT NULL, 
HP NUMBER(3) NOT NULL, 
SP NUMBER(3) NOT NULL, 
XP NUMBER(3) NOT NULL, 
COLD_WEAPONS VARCHAR(20), 
SHIRT VARCHAR(20), 
PANTS VARCHAR(20), 
ACESSORY VARCHAR (20), 
GUN VARCHAR(20), 
PLAYER_NAME VARCHAR(20), 
CONSTRAINT PK_PLAYER PRIMARY KEY (PLAYER_NAME) 
);

CREATE TABLE PERSONA(   --CRIANDO TABELA PERSONA 
CODE NUMBER(4), 
TYPE VARCHAR(20) NOT NULL, 
NAME VARCHAR(20) NOT NULL UNIQUE, 
 
CONSTRAINT PK_PERSONA PRIMARY KEY (CODE) 
);

CREATE TABLE PLAYER_PERSONA( 
CODE NUMBER(4), 
PLAYER_NAME VARCHAR(20) NOT NULL, 
 
CONSTRAINT PLAYER_PERSONA_PK PRIMARY KEY (CODE), 
CONSTRAINT PLAYER_PERSONA_FK FOREIGN KEY(PLAYER_NAME) REFERENCES 
PLAYER ON DELETE CASCADE, 
CONSTRAINT PERSONA_FK FOREIGN KEY(CODE) REFERENCES 
PERSONA ON DELETE CASCADE 
);

CREATE TABLE WILD_PERSONA( 
CODE NUMBER(4), 
 
CONSTRAINT WILD_PERSONA_PK PRIMARY KEY (CODE), 
CONSTRAINT WILD_PERSONA_FK FOREIGN KEY(CODE) REFERENCES 
PERSONA ON DELETE CASCADE 
);

CREATE TABLE TEAM_PERSONA( 
CODE NUMBER(4), 
 
CONSTRAINT TEAM_PERSONA_PK PRIMARY KEY (CODE), 
CONSTRAINT TEAM_PERSONA_FK FOREIGN KEY(CODE) REFERENCES 
PLAYER_PERSONA ON DELETE CASCADE 
);

CREATE TABLE SOLD_PERSONA( 
CODE NUMBER(4), 
COST NUMBER(4) NOT NULL, 
 
CONSTRAINT SOLD_PERSONA_PK PRIMARY KEY (CODE), 
CONSTRAINT SOLD_PERSONA_FK FOREIGN KEY(CODE) REFERENCES 
PLAYER_PERSONA ON DELETE CASCADE 
);

CREATE TABLE PRISON( 
PRISON_ID NUMBER(4), 
CODE NUMBER (4) NOT NULL, 
 
CONSTRAINT PRISON_PK PRIMARY KEY (PRISON_ID), 
CONSTRAINT PRISON_FK FOREIGN KEY(CODE) REFERENCES 
TEAM_PERSONA ON DELETE CASCADE 
);

CREATE TABLE REWARD( 
TYPE_REWARD VARCHAR(20), 
CONSTRAINT REWARD_PK PRIMARY KEY (TYPE_REWARD) 
);

CREATE TABLE EXCHANGE( 
SELLER_NAME VARCHAR(20), 
BUYER_NAME VARCHAR(20), 
DATA DATE, 
 
CONSTRAINT EXCHANGE_PK PRIMARY KEY (SELLER_NAME, BUYER_NAME, DATA), 
CONSTRAINT EXCHANGE_SELLER_FK FOREIGN KEY(SELLER_NAME) REFERENCES 
PLAYER ON DELETE CASCADE, 
CONSTRAINT EXCHANGE_BUYER_FK FOREIGN KEY(BUYER_NAME) REFERENCES 
PLAYER ON DELETE CASCADE 
);

CREATE TABLE ITEM( 
PERSONA_CODE NUMBER(4), 
CODE_ITEM NUMBER(4), 
PLAYER_NAME VARCHAR(20), 
 
CONSTRAINT ITEM_PK PRIMARY KEY (PERSONA_CODE, CODE_ITEM), 
CONSTRAINT ITEM_PERSONA_FK FOREIGN KEY(PERSONA_CODE) REFERENCES 
PERSONA ON DELETE CASCADE, 
CONSTRAINT ITEM_PLAYER_FK FOREIGN KEY(PLAYER_NAME) REFERENCES 
PLAYER ON DELETE CASCADE 
);

CREATE TABLE ATTACK( 
PERSONA_CODE NUMBER(4), 
ATTACK VARCHAR(20), 
 
CONSTRAINT ATTACK_PK PRIMARY KEY (PERSONA_CODE, ATTACK), 
CONSTRAINT ATTACK_FK FOREIGN KEY(PERSONA_CODE) REFERENCES 
PERSONA ON DELETE CASCADE 
);

CREATE TABLE BATTLE( 
TEAM_PERSONA_CODE NUMBER(4), 
WILD_PERSONA_CODE NUMBER(4), 
PLAYER_NAME VARCHAR(20) NOT NULL, 
REWARD_TYPE VARCHAR(20), 
BATTLE_ID NUMBER(3), 
RESULT VARCHAR(5) NOT NULL, 
 
CONSTRAINT BATTLE_PK PRIMARY KEY (TEAM_PERSONA_CODE, WILD_PERSONA_CODE, BATTLE_ID), 
CONSTRAINT BATTLE_TEAM_PERSONA_FK FOREIGN KEY(TEAM_PERSONA_CODE) REFERENCES 
TEAM_PERSONA ON DELETE CASCADE, 
CONSTRAINT BATTLE_WILD_PERSONA_FK FOREIGN KEY(WILD_PERSONA_CODE) REFERENCES 
WILD_PERSONA ON DELETE CASCADE, 
CONSTRAINT BATTLE_PLAYER_FK FOREIGN KEY(PLAYER_NAME) REFERENCES 
PLAYER ON DELETE CASCADE, 
CONSTRAINT BATTLE_REWARD_FK FOREIGN KEY(REWARD_TYPE) REFERENCES 
REWARD ON DELETE CASCADE 
);

Insert Into Player Values( 
0000, 100, 050, 062, 'FACAO', 'REGATA', 'BERMUDACYCLONE', 'BRINCO', 'AK47', 'EDNA' 
);

Insert Into Player Values( 
0010, 030, 030, 061, 'ADAGA', 'CAMISA', 'BERMUDA', 'ALARGADOR', 'M4A1', 'RUI' 
);

Insert Into Player Values( 
0020, 300, 020, 063, 'KATANA', 'CAMISETA', 'SHORT', 'PIERCING', 'PISTOLA', 'ROBSON' 
);

Insert Into Player Values( 
0030, 090, 010, 064, 'CANIVETE', 'CASACO', 'SAMBA CANCAO', 'ANEL', 'GLOCK', 'EDUARDO' 
);

Insert Into Player Values( 
0040, 080, 040, 065, 'ESPADA', 'MOLETOM', 'CALCA', 'CHAPEU', '3 OITAO', 'ACM' 
);

Insert Into Player Values( 
0050, 200, 070, 066, 'SABRE', 'TERNO', 'CALCA MOLETOM', 'OCULOS', 'RIFLE', 'GUSTAVO' 
);

Insert Into Player Values( 
0060, 020, 080, 067, 'COLHER', 'CAMISA', 'SAIA', 'CARTOLA', 'ESPINGARDA', 'TSANG' 
);

Insert Into Player Values( 
0070, 010, 090, 068, 'BASTAO', 'REGATA', 'SHORT', 'RELOGIO', 'FUZIL', 'ANJOLINA' 
);

Insert Into Player Values( 
0080, 600, 060, 069, 'PEXEIRA', 'REGATA', 'BERMUDACYCLONE', 'PULSEIRA', 'METRALHADORA', 'PAULO' 
);

Insert Into Player Values( 
0089, 040, 660, 090, 'GATO', 'REGATA', 'BERMUDACYCLONE', 'COLAR', 'GRANADA', 'STEFAN' 
);

INSERT INTO PERSONA values( 
0001, 'FOOL', 'LUIZ' 
);

INSERT INTO PERSONA values( 
0002, 'JOKER', 'RICARDO' 
);

INSERT INTO PERSONA values( 
0003, 'FOOL', 'EDUARDO' 
);

INSERT INTO PERSONA values( 
0004, 'MAGCIAN', 'RODRIGO' 
);

INSERT INTO PERSONA values( 
0005, 'PRIESTESS', 'MARIA' 
);

INSERT INTO PERSONA values( 
0006, 'DEVIL', 'JOAO' 
);

INSERT INTO PERSONA values( 
0007, 'EMPEROR', 'ROGERIO' 
);

INSERT INTO PERSONA values( 
0008, 'DEVIL', 'LUCIA' 
);

INSERT INTO PERSONA values( 
0009, 'DEATH', 'LUANA' 
);

INSERT INTO PERSONA values( 
0010, 'EMPRESS', 'LIVIA' 
);

INSERT INTO PERSONA values( 
0011, 'HANGED MAN', 'REGINALDO' 
);

INSERT INTO PERSONA values( 
0012, 'MAGICIAN', 'GUILHERME' 
);

INSERT INTO PERSONA values( 
0013, 'DEATH', 'IGOR' 
);

INSERT INTO PERSONA values( 
0014, 'JUSTICE', 'THIAGO' 
);

INSERT INTO PERSONA values( 
0015, 'JOKER', 'CARLOS' 
);

INSERT INTO PERSONA values( 
0016, 'HANGED MAN', 'HEISENBERG' 
);

INSERT INTO PERSONA values( 
0017, 'PRIESTESS', 'PEDRO' 
);

INSERT INTO PERSONA values( 
0018, 'JUSTICE', 'LUCAS' 
);

INSERT INTO PERSONA values( 
0019, 'EMPRESS', 'FILIPE' 
);

INSERT INTO PERSONA values( 
0020, 'EMPEROR', 'GABRIEL' 
);

INSERT INTO PERSONA values( 
0021, 'FOOL', 'PABLO' 
);

INSERT INTO PERSONA values( 
0022, 'EMPEROR', 'JOSE' 
);

INSERT INTO PERSONA values( 
0023, 'DEATH', 'MARCOS' 
);

INSERT INTO PERSONA values( 
0024, 'DEATH', 'NIVAN' 
);

INSERT INTO PERSONA values( 
0025, 'DEATH', 'LEONARDO' 
);

INSERT INTO PERSONA values( 
0026, 'DEATH', 'DIEGO' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0020, 'EDNA' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0001, 'EDUARDO' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0002, 'RUI' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0003, 'PAULO' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0004, 'GUSTAVO' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0005, 'STEFAN' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0006, 'ROBSON' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0007, 'ANJOLINA' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0008, 'TSANG' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0009, 'ACM' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0021, 'ACM' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0022, 'TSANG' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0023, 'ANJOLINA' 
);

INSERT INTO PLAYER_PERSONA VALUES( 
0024, 'STEFAN' 
);

Insert Into PLAYER_PERSONA VALUES( 
0025, 'TSANG' 
);

Insert Into PLAYER_PERSONA VALUES( 
0026, 'ACM' 
);

INSERT INTO WILD_PERSONA VALUES( 
0010 
);

INSERT INTO WILD_PERSONA VALUES( 
0011 
);

INSERT INTO WILD_PERSONA VALUES( 
0012 
);

INSERT INTO WILD_PERSONA VALUES( 
0013 
);

INSERT INTO WILD_PERSONA VALUES( 
0014 
);

INSERT INTO WILD_PERSONA VALUES( 
0015 
);

INSERT INTO WILD_PERSONA VALUES( 
0016 
);

INSERT INTO WILD_PERSONA VALUES( 
0017 
);

INSERT INTO WILD_PERSONA VALUES( 
0018 
);

INSERT INTO WILD_PERSONA VALUES( 
0019 
);

INSERT INTO TEAM_PERSONA VALUES( 
0020 
);

INSERT INTO TEAM_PERSONA VALUES( 
0001 
);

INSERT INTO TEAM_PERSONA VALUES( 
0002 
);

INSERT INTO TEAM_PERSONA VALUES( 
0003 
);

INSERT INTO TEAM_PERSONA VALUES( 
0004 
);

INSERT INTO TEAM_PERSONA VALUES( 
0005 
);

INSERT INTO TEAM_PERSONA VALUES( 
0006 
);

INSERT INTO TEAM_PERSONA VALUES( 
0007 
);

INSERT INTO TEAM_PERSONA VALUES( 
0008 
);

INSERT INTO TEAM_PERSONA VALUES( 
0009 
);

INSERT INTO TEAM_PERSONA VALUES( 
0024 
);

INSERT INTO TEAM_PERSONA VALUES( 
0025 
);

INSERT INTO TEAM_PERSONA VALUES( 
0026 
);

INSERT INTO SOLD_PERSONA VALUES( 
0021, 0010 
);

INSERT INTO SOLD_PERSONA VALUES( 
0022, 0090 
);

INSERT INTO SOLD_PERSONA VALUES( 
0023, 1000 
);

Insert INTO PRISON VALUES( 
0001, 0024 
);

Insert INTO PRISON VALUES( 
0002, 0025 
);

Insert INTO PRISON VALUES( 
0003, 0026 
);

INSERT INTO REWARD VALUES( 
'PERSONA' 
);

INSERT INTO REWARD VALUES( 
'ITEM' 
);

INSERT INTO REWARD VALUES( 
'COINS' 
);

INSERT INTO REWARD VALUES( 
'XP' 
);

INSERT INTO EXCHANGE VALUES( 
'EDNA', 'EDUARDO', TO_DATE('12/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'TSANG', 'PAULO', TO_DATE('13/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'TSANG', 'GUSTAVO', TO_DATE('12/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'STEFAN', 'ROBSON', TO_DATE('12/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'ACM', 'EDUARDO', TO_DATE('13/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'EDNA', 'TSANG', TO_DATE('12/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'ANJOLINA', 'ACM', TO_DATE('14/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'RUI', 'STEFAN', TO_DATE('12/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'STEFAN', 'RUI', TO_DATE('13/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'ROBSON', 'EDNA', TO_DATE('13/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO EXCHANGE VALUES( 
'PAULO', 'GUSTAVO', TO_DATE('25/12/2023', 'DD/MM/YYYY') 
);

INSERT INTO ITEM VALUES( 
0001, 0001, 'EDUARDO' 
);

INSERT INTO ITEM VALUES( 
0002, 0002, 'RUI' 
);

INSERT INTO ITEM VALUES( 
0025, 0003, 'TSANG' 
);

INSERT INTO ITEM VALUES( 
0021, 0003, 'ACM' 
);

INSERT INTO ITEM VALUES( 
0008, 0004, 'TSANG' 
);

INSERT INTO ITEM VALUES( 
0006, 0002, 'ROBSON' 
);

INSERT INTO ITEM VALUES( 
0012, 0001, NULL 
);

INSERT INTO ITEM VALUES( 
0014, 0001, NULL 
);

INSERT INTO ATTACK VALUES( 
0001, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0002, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0003, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0004, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0005, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0006, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0007, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0008, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0009, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0010, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0011, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0012, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0013, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0014, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0015, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0016, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0017, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0018, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0019, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0020, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0021, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0022, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0023, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0024, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0025, 'TIRO' 
);

INSERT INTO ATTACK VALUES( 
0025, 'MURRO' 
);

INSERT INTO ATTACK VALUES( 
0025, 'MAGIA' 
);

INSERT INTO ATTACK VALUES( 
0024, 'MAGIA' 
);

INSERT INTO BATTLE VALUES( 
0001, 0010,'EDUARDO',  NULL, 001, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0003, 0010,'PAULO',  'COINS', 002, 'LOSE' 
);

INSERT INTO BATTLE VALUES( 
0005, 0019,'STEFAN',  'COINS', 003, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0007, 0018,'ANJOLINA',  'ITEM', 004, 'LOSE' 
);

INSERT INTO BATTLE VALUES( 
0006, 0017,'ROBSON', 'PERSONA', 005, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0004, 0013,'GUSTAVO',  NULL, 006, 'LOSE' 
);

INSERT INTO BATTLE VALUES( 
0004, 0014,'GUSTAVO',  'COINS', 007, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0005, 0014,'STEFAN',  NULL, 008, 'LOSE' 
);

INSERT INTO BATTLE VALUES( 
0007, 0014,'ANJOLINA',  'ITEM', 009, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0005, 0012,'STEFAN',  NULL, 010, 'LOSE' 
);

INSERT INTO BATTLE VALUES( 
0002, 0014,'RUI',  'ITEM', 011, 'WIN' 
);

INSERT INTO BATTLE VALUES( 
0004, 0011, 'GUSTAVO', 'COINS', 012, 'LOSE' 
);

-- NOME DOS PLAYERS COM MAIS DE UM PERSONA (GROUP BY/HAVING)
SELECT P.PLAYER_NAME, COUNT(*)  
FROM PLAYER P INNER JOIN PLAYER_PERSONA PP ON (P.PLAYER_NAME = PP.PLAYER_NAME)  
GROUP BY P.PLAYER_NAME  
HAVING COUNT(*)>1;

-- NOME DAS TEAM_PERSONAS QUE GANHARAM ALGUMA BATALHA (INNER JOIN)
Select P.NAME  
FROM PERSONA P INNER JOIN BATTLE B ON (B.TEAM_PERSONA_CODE = P.CODE)   
WHERE B.RESULT LIKE 'WIN';

-- NOME DAS PERSONAS QUE NÃO PODEM SER TROCADAS POR ITENS (JUNÇÃO EXTERNA)
Select P.NAME  
FROM PERSONA P Left Outer Join Item I ON (P.CODE = I.PERSONA_CODE)   
WHERE I.PERSONA_CODE IS NULL;

-- PLAYERS QUE NÃO BATALHARAM (ANTI-JUNÇÃO)
SELECT P.PLAYER_NAME
FROM PLAYER P
WHERE NOT EXISTS(SELECT *
    			FROM BATTLE B
    			WHERE B.PLAYER_NAME = P.PLAYER_NAME);

-- WILD PERSONAS QUE BRIGARAM (SEMI-JUNÇÃO)
SELECT P.NAME
FROM PERSONA P
WHERE P.CODE IN (SELECT WP.CODE
				FROM WILD_PERSONA WP
				WHERE EXISTS(SELECT *
    						FROM BATTLE B
    						WHERE B.WILD_PERSONA_CODE = WP.CODE));

-- NOME DO PLAYER COM MAIS MOEDAS (ESCALAR)
Select PLAYER_NAME  
FROM PLAYER  
WHERE COIN =  
    (SELECT MAX(COIN)  
     FROM PLAYER );

-- NOME DOS VENDEDORES QUE VENDERAM PARA EDUARDO NA DATA 12/12/2023 (LINHA)
Select  SELLER_NAME  
FROM EXCHANGE  
WHERE (DATA, BUYER_NAME) =  
    (SELECT DATA, BUYER_NAME  
     FROM EXCHANGE  
     WHERE DATA = TO_DATE('12/12/2023', 'DD/MM/YYYY') AND BUYER_NAME = 'EDUARDO');

-- NOME DOS PLAYERS QUE POSSUEM MOEDAS TIRANDO O COM A MENOR QUANTIDADE (TABELA)
Select PLAYER_NAME  
FROM PLAYER  
WHERE COIN > ANY  
	(SELECT COIN  
     FROM PLAYER);

SELECT PLAYER_NAME 
FROM PLAYER 
WHERE PLAYER_NAME IN 
    (SELECT PLAYER_NAME 
    FROM PLAYER_PERSONA 
    WHERE CODE IN 
    	(SELECT CODE 
    	FROM SOLD_PERSONA)) 
 
;

-- NOME DOS PLAYERS QUE POSSUEM PERSONAS VENDIDAS OU NA PRISÃO (OPERAÇÃO DE CONJUNTO)
SELECT PLAYER_NAME  
FROM PLAYER  
WHERE PLAYER_NAME IN  
    (SELECT PLAYER_NAME  
    FROM PLAYER_PERSONA  
    WHERE CODE IN  
    	((SELECT CODE  
    	FROM SOLD_PERSONA)  
    	UNION  
    		(SELECT CODE  
    		FROM PRISON)));

-- FUNÇÃO QUE RETORNA QUANTIDADE DE BATALHAS FEITAS PELA PESSOA
CREATE OR REPLACE FUNCTION qtd_batalhas(NAME VARCHAR) RETURN NUMBER IS 
    qtd number; 
BEGIN 
    SELECT COUNT(PLAYER_NAME) INTO qtd 
    FROM BATTLE B 
    WHERE B.PLAYER_NAME = NAME; 
 
    RETURN qtd; 
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RETURN NULL; 
END;
/

begin 
  dbms_output.put_line ('quantidade :'||qtd_batalhas('EDNA') ); 
end;
/

begin 
  dbms_output.put_line ('quantidade :'||qtd_batalhas('GUSTAVO') ); 
end;
/

-- FUNÇÃO QUE RETORNA A QUANTIDADE DE PERSONAS EM CADA TIPO
CREATE OR REPLACE FUNCTION QTD_TYPE(NOME VARCHAR) RETURN NUMBER IS     
qtd NUMBER;     
BEGIN     
SELECT COUNT(NAME) INTO qtd     
FROM PERSONA P     
WHERE P.TYPE = NOME;     
RETURN qtd;   
	EXCEPTION     
        WHEN NO_DATA_FOUND THEN     
        RETURN NULL;     
END;
/

BEGIN   
DBMS_OUTPUT.PUT_LINE('Quantidade: '||QTD_TYPE('DEATH'));   
END;
/

-- PROCEDEDURE PARA MOSTRAR OS COMPRADORES DISTINTOS QUE COMEÇAM COM A LETRA 'E'
CREATE OR REPLACE PROCEDURE troca IS  
	CURSOR curr IS  
	SELECT DISTINCT BUYER_NAME  
	FROM EXCHANGE  
	WHERE BUYER_NAME LIKE 'E%';  
BEGIN  
	FOR I IN curr loop  
		DBMS_OUTPUT.PUT_LINE('NOME: '||I.BUYER_NAME);  
	END LOOP;  
END;  
/

BEGIN 
troca; 
end;
/

Select BUYER_NAME   
FROM EXCHANGE   
WHERE (DATA, SELLER_NAME) IN   
    (SELECT DATA, SELLER_NAME   
     FROM EXCHANGE   
     WHERE DATA = TO_DATE('14/12/2023', 'DD/MM/YYYY') AND SELLER_NAME = 'ANJOLINA');

-- TRIGGER
CREATE OR REPLACE TRIGGER BUYER_TROCA  
BEFORE INSERT OR UPDATE OF BUYER_NAME ON EXCHANGE  
REFERENCING OLD AS ANTIGO NEW AS NOVO  
FOR EACH ROW WHEN(ANTIGO.BUYER_NAME = 'GUSTAVO')  
BEGIN  
	IF UPDATING THEN  
		DBMS_OUTPUT.PUT_LINE('TUDO SE MANTEM, MENOS O BUYER_NAME: DE GUSTAVO PARA '||:NOVO.BUYER_NAME);  
	END IF; 
  
	IF INSERTING THEN  
        DBMS_OUTPUT.PUT_LINE('TUDO É SOBRE O VALOR RECENTE, INCLUSIVE O DA MUDANÇA DE GUSTAVO PARA '||:NOVO.BUYER_NAME);  
	END IF;  
END;
/
