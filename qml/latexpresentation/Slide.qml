/***************************************************************************
**
** This file is part of QML Presentation System **
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

Item {
    id: slide

    property alias contentFont: centeredId.font
    property alias titleFont: titleText.font

    property bool isSlide: true;

    property string title;
    property variant content: []
    property string centeredText

    property real _fontSize: height * 0.06
    property real _fontScale: 1

    property real _baseFontSize: _fontSize * _fontScale
    property real _titleFontSize: _fontSize * _fontScale * 1.1
    property real bulletSpacing: 1

    property real contentWidth: width

    // Define the slide to be the "content area"
    x: parent.width * 0.05
    y: parent.height * 0.05
    width: parent.width * 0.9
    height: parent.height * 0.90

    property color slideTextColor: parent.textColor !== undefined ? parent.textColor : "black"
    property string contentFontFamily: parent.fontFamily !== undefined ? parent.fontFamily : "Source Sans Pro"
    property string titleFontFamily: parent.fontFamily !== undefined ? parent.fontFamily : "Utopia"

    visible: false

    Text {
        id: titleText
        text: title;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent._fontSize * 1.0
        font.family: titleFontFamily
        font.weight: Font.Light
        font.pixelSize: _titleFontSize
        color: slideTextColor
        horizontalAlignment: Text.Center
    }

    Text {
        id: centeredId
        width: parent.width
        anchors.centerIn: parent
//        anchors.verticalCenterOffset: parent.y / 3
        text: centeredText
        horizontalAlignment: Text.Center
        font.pixelSize: _baseFontSize
        font.family: contentFontFamily
        font.weight: Font.Light
        color: slideTextColor
        wrapMode: Text.Wrap
    }

    Column {
        id: contentId
//        anchors {
//            left: parent.left
//            right: parent.right
//            bottom: parent.bottom
//            top: titleText.bottom
//            topMargin: parent._fontSize * 1.0
//        }
        anchors.centerIn: parent

        Repeater {
            model: content.length

            Row {
                id: row

                function decideIndentLevel(s) { return s.charAt(0) == " " ? 1 + decideIndentLevel(s.substring(1)) : 0 }
                property int indentLevel: decideIndentLevel(content[index])
                property int nextIndentLevel: index < content.length - 1 ? decideIndentLevel(content[index+1]) : 0
                property real indentFactor: (10 - row.indentLevel * 2) / 10;

                height: text.height + (nextIndentLevel == 0 ? 1 : 0.3) * slide._baseFontSize * slide.bulletSpacing
                x: slide._baseFontSize * indentLevel

                Rectangle {
                    id: dot
                    y: _baseFontSize * row.indentFactor / 2
                    width: _baseFontSize / 4
                    height: _baseFontSize / 4
                    color: slide.slideTextColor
                    radius: width / 2
                    smooth: true
                    opacity: text.text.length == 0 ? 0 : 1
                }

                Rectangle {
                    id: space
                    width: dot.width * 2
                    height: 1
                    color: "#00ffffff"
                }

                Text {
                    id: text
                    width: slide.contentWidth - parent.x - dot.width - space.width
                    font.pixelSize: _baseFontSize * row.indentFactor
                    text: content[index]
                    textFormat: Text.PlainText
                    wrapMode: Text.WordWrap
                    font.family: contentFontFamily
                    font.weight: Font.Light
                    color: slide.slideTextColor
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }
    }

}
