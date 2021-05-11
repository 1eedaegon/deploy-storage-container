# db를 위한 CIDR 네트워크 구성
# docker는 폴더 이름별로 네트워크를 구성하기 때문에 같은 폴더이름은 같은 네트워크에 속한다.
# 또한 생성하지 않은 external defualt network는 네트워크 이름 맨 뒤에 _default가 붙는다.
# 커스텀 네트워크를 생성하면 기본은 172.0.0.0/16이다. hostname은 container_name이다.
# 따로 Bridge나 macvlan을 이용한 CIDR 서브네팅 같은 것은 설명하지 않는다.

docker network create mongo-network
docker network create maria-network
docker network create postgres-network
