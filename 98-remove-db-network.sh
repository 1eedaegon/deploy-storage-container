# db를 위한 네트워크 구성
# Bridge나 macvlan을 이용한 CIDR 서브네팅 같은 것은 설명하지 않는다.

docker network rm mongo-network
docker network rm maria-network
docker network rm postgre-network
