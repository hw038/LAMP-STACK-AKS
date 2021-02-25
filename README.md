# LAMP-STACK-AKS

## 목적
LAMP Stack을 AKS 환경에 배포하며 쿠버네티스 환경 이해

1. 구조

    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fa00b6f7-9bcd-4896-aa3e-24ba5b066933/k8s-LAMP-Stack_archi.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fa00b6f7-9bcd-4896-aa3e-24ba5b066933/k8s-LAMP-Stack_archi.png)

    세팅 과정 요약

    1) Docker 이미지 생성

    web - ubuntu, apache, php7 + source(blog)

    db - MySQL 5.6 + DB data(blog)

    2) 로컬 환경에서 테스트

    Virtaul Box k8s Cluster에서 구축 후 curl로 정상 연동 확인

    3) AKS 세팅

    d2 3개 노드 세팅

    Docker repo public(web,db) 사용하여 deployment, svc 세팅

    테스트 결과 DB 데이터 안들어가있음 확인하여 별도로 import

    (kubectl exec pod mysql -it -- mysql -u root -prP@ssw0rd blog < data.sql)

    4) 최적화

    nginx-ingress controller

    DB PVC(File Share)

2. Docker Image 작성

    
