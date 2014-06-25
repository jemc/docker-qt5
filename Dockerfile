FROM        ubuntu:14.04
MAINTAINER  Joe Eli McIlvain <joe.eli.mac@gmail.com>

RUN apt-key update && apt-get update
RUN apt-get install -y build-essential perl python git
RUN apt-get install -y libGL-dev

RUN git clone https://git.gitorious.org/qt/qt5.git qt5

RUN cd qt5 && git checkout stable
RUN cd qt5 && perl init-repository --no-webkit
RUN cd qt5 && ./configure -developer-build -confirm-license -opensource \
                          -qt-xcb -nomake examples -nomake tests
RUN cd qt5 && make -j4 all

ENV PATH /qt5/qtbase/bin:$PATH
