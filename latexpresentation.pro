TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
            latexrunner.cpp

HEADERS += \
    latexrunner.h


#RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    images/density-trim.png \
    qml/latexpresentation/BorderedImage.qml \
    qml/latexpresentation/Heading.qml \
    qml/latexpresentation/Latex.qml \
    qml/latexpresentation/LowerLeftSlide.qml \
    qml/latexpresentation/LowerRightSlide.qml \
    qml/latexpresentation/main.qml \
    qml/latexpresentation/MyPresentation.qml \
    qml/latexpresentation/Presentation.qml \
    qml/latexpresentation/Slide.qml \
    qml/latexpresentation/TransitionPresentation.qml \
    qml/latexpresentation/UpperLeftSlide.qml \
    qml/latexpresentation/UpperRightSlide.qml \
    qml/latexpresentation/formula.tex \
    qml/latexpresentation/MultiSlide.qml

copydata.commands = $(COPY_DIR) $$PWD/qml $$PWD/images $$OUT_PWD
first.depends = $(first) copydata
export(first.depends)
export(copydata.commands)
QMAKE_EXTRA_TARGETS += first copydata
