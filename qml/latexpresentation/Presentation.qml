/***************************************************************************
**
** This file is part of the QML Presentation System **
**
** Copyright (c) 2010 Nokia Corporation and/or its subsidiary(-ies).*
**
** All rights reserved.
** Contact:  Nokia Corporation (qt-info@nokia.com)
**
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**
**  * Redistributions of source code must retain the above copyright notice,
**    this list of conditions and the following disclaimer.
**  * Redistributions in binary form must reproduce the above copyright notice,
**    this list of conditions and the following disclaimer in the documentation
**    and/or other materials provided with ** the distribution.
**  * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor the
**    names of its contributors may be used to endorse or promote products
**    derived from this software without specific ** prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
** ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
** LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
** DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
** SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
** CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
** OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
**************************************************************************/

import QtQuick 2.2
import QtQuick.Window 2.0

Item {
    id: root

    signal showFullScreen;
    signal showNormal;

    property variant slides: []
    property int currentSlide;
    property bool showNotes: false;
    property bool allowDelay: true;

    property bool fullScreen: true

    // Private API
    property bool _faded: false
    property int _userNum;

    onFullScreenChanged: {
        if(fullScreen) {
            showFullScreen()
        } else {
            showNormal()
        }
    }

    Component.onCompleted: {
        loadSlides()
    }

    function loadSlides() {
        var slideCount = 0;
        var slides = [];
        for (var i=0; i<root.children.length; ++i) {
            var r = root.children[i];
            if (r.isSlide) {
                slides.push(r);
                r.visible = false
            }
        }

        root.slides = slides;
        root._userNum = 0;

        // Make first slide visible...
        if (root.slides.length > 0) {
            root.currentSlide = 0;
            root.slides[root.currentSlide].visible = true;
        }
    }

    function switchSlides(from, to, forward) {
        from.visible = false
        to.visible = true
        return true
    }

    function goToFirstSlide() {
        root._userNum = 0
        if (_faded) {
            return
        }
        var from = slides[currentSlide]
        var to = slides[0]
        if (switchSlides(from, to, false)) {
            currentSlide = 0;
            root.focus = true;
        }
    }

    function goToLastSlide() {
        root._userNum = 0
        if (_faded) {
            return
        }
        var from = slides[currentSlide]
        var to = slides[root.slides.length - 1]
        if (switchSlides(from, to, true)) {
            currentSlide = root.slides.length - 1;
            root.focus = true;
        }
    }

    function goToNextSlide() {
        root._userNum = 0
        if (_faded)
            return
        if (root.slides[currentSlide].delayPoints) {
            if (root.slides[currentSlide]._advance())
                return;
        }
        if (root.currentSlide + 1 < root.slides.length) {
            var from = slides[currentSlide]
            var to = slides[currentSlide + 1]
            if (switchSlides(from, to, true)) {
                currentSlide = currentSlide + 1;
                root.focus = true;
            }
        }
    }

    function goToPreviousSlide() {
        root._userNum = 0
        if (root._faded)
            return
        if (root.slides[currentSlide].delayPoints) {
            if (root.slides[currentSlide]._retreat())
                return;
        }
        if (root.currentSlide - 1 >= 0) {
            var from = slides[currentSlide]
            var to = slides[currentSlide - 1]
            if (switchSlides(from, to, false)) {
                currentSlide = currentSlide - 1;
                root.focus = true;
            }
        }
    }

    function goToUserSlide() {
        --_userNum;
        if (root._faded || _userNum >= root.slides.length)
            return
        if (_userNum < 0)
            goToNextSlide()
        else if (root.currentSlide != _userNum) {
            var from = slides[currentSlide]
            var to = slides[_userNum]
            if (switchSlides(from, to, _userNum > currentSlide)) {
                currentSlide = _userNum;
                root.focus = true;
            }
        }
    }

    focus: true

    Keys.onSpacePressed: goToNextSlide()
    Keys.onRightPressed: goToNextSlide()
    Keys.onDownPressed: goToNextSlide()
    Keys.onLeftPressed: goToPreviousSlide()
    Keys.onUpPressed: goToPreviousSlide()
    Keys.onEscapePressed: Qt.quit()
    Keys.onPressed: {
        if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9)
            _userNum = 10 * _userNum + (event.key - Qt.Key_0)
        else {
            if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
                goToUserSlide();
            } else if (event.key == Qt.Key_Backspace) {
                goToPreviousSlide();
            } else if (event.key == Qt.Key_End) {
                goToLastSlide();
            } else if (event.key == Qt.Key_Home) {
                goToFirstSlide();
            } else if (event.key == Qt.Key_C) {
                root._faded = !root._faded;
            } else if (event.key == Qt.Key_F5 || event.key == Qt.Key_F11) {
                fullScreen = !fullScreen
            }
            _userNum = 0;
        }
    }

    Rectangle {
        z: 1000
        color: "black"
        anchors.fill: parent
        opacity: root._faded ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 250 } }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton)
                goToPreviousSlide()
            else
                goToNextSlide()
        }
    }

    Window {
        id: notesWindow;
        width: 400
        height: 300
        title: "QML Presentation: Notes"
        visible: root.showNotes
        Text {
            anchors.fill: parent
            anchors.margins: parent.height * 0.1;
            font.pixelSize: 16
            wrapMode: Text.WordWrap
            property string notes: root.slides[root.currentSlide].notes;
            text: notes == "" ? "Slide has no notes..." : notes;
            font.italic: notes == "";
        }
    }
}
