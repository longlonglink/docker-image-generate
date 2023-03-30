FROM --platform=linux/amd64 ubuntu
RUN  apt update \
     &&  apt install -y build-essential libncurses5-dev gawk git libssl-dev gettext zlib1g-dev swig unzip time rsync python3 python3-setuptools python3-yaml \
     &&  git config --global user.email "loophank110@gmail.com" \
     &&  git config --global user.name "longlonglink" \
     &&  git clone https://github.com/gl-inet/gl-infra-builder.git \
     &&  cd gl-infra-builder \
     &&  python3 setup.py -c configs/config-wlan-ap.yml \
     &&  cd wlan-ap/openwrt \
     &&  git clone https://github.com/gl-inet/glinet4.x.git
RUN  cp ./glinet4.x/pkg_config/gl_pkg_config_ax1800.mk  ./glinet4.x/ipq60xx/gl_pkg_config.mk \
     && cp ./glinet4.x/pkg_config/glinet_depends_ax1800.yml  ./profiles/glinet_depends.yml \
     && ./scripts/gen_config.py glinet_depends
     
