<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />
<xsl:template match="/">
<html>
<head>
<link href="crossword.css" type="text/css" rel="stylesheet"/>
<title>
<xsl:value-of select="title"/>
</title>
</head>
<body onload="" style="display:inline-flex;flex-wrap:wrap;" bgcolor="black">
<div id="messageBox" class="messageBoxHolder">
<span id="codePos" class="consoleBox">CodePosition = </span>
<span id="inputCellNo" class="consoleBox">userClick Cell No. Cols = </span>
<span id="altInputCellNo" class="consoleBox">userClick Cell No. Rows = </span>
<span id="cursorPositionCounter" class="consoleBox">cursorPosInAns = </span>
<span id="cellCounter" class="consoleBox">iterations = </span>
<span id="wantedClueNumberDisplay" class="consoleBox">Req Clue = </span>
<span id="acrossOrDownResult" class="consoleBox"/>
<span id="lengthOfAcrossAnswerDisplay" class="consoleBox">Length Across Answer = </span>
<span id="lengthOfDownAnswerDisplay" class="consoleBox">Length Down Answer = </span>
<span id="trafficLightDisplay" class="consoleBox">traffic light = </span>
<button>Submit</button>
<button>Save</button>
</div>

<xsl:apply-templates/>
</body>
</html>
</xsl:template>
    <xsl:template match="title">
                    <div class="clueDirectionDiv">
                        <h1 class="clueDirection">
                            <xsl:apply-templates/>
                        </h1>
                    </div>
                </xsl:template>
                <xsl:template match="content">
                    <p align="center" bgcolor="black" height="200px" width="200px">
                        <xsl:apply-templates/>
                    </p>
                </xsl:template>
                <xsl:template match="comment">
                    <i>
                        <xsl:apply-templates/>
                    </i>
                </xsl:template>
                <xsl:template match="grid">
                    <div class="clueExpansionBox"></div>
                    <div class="crosswordGrid" id="crosswordGrid">
                        <xsl:apply-templates/>
                    </div>
                </xsl:template>
                <xsl:template match="cell">
                    <div class="crosswordCell">
                        <span class="clueNumberInCell">
                            <xsl:value-of select="@number"/>
                        </span>
                        <input class="letterInput" type="text" maxlength="1" size="1" value="" 
 tabindex="-1" name="" oninput=""></input>
                        <span class="yNumberInCell">
                            <xsl:value-of select="@y"/>
                        </span>
                        <span class="xNumberInCell">
                            <xsl:value-of select="@x"/>
                        </span>
                        <span class="solution" style="display:none;">
                            <xsl:value-of select="@solution"/>
                        </span>
                        <xsl:apply-templates/>
                    </div>
                </xsl:template>
                <xsl:template match="cell[@type='block']">
                    <div class="crosswordCell" tabindex="-1" style="background-color:black;">
                        <xsl:apply-templates/>
                        <span class="yNumberInCell">0</span>
                        <span class="xNumberInCell">0</span>
                    </div>
                </xsl:template>
                <xsl:template match="clues">
                    <div class="cluesBox" style="" id="{generate-id()}">
                        <xsl:apply-templates/>
                    </div>
                </xsl:template>
                <xsl:template match="clue">
                    <div class="individualClueBox">
                        <span class="clueNumber" id="{generate-id()}">
                            <xsl:value-of select="@number"/>
                        </span>
                        <span class="clueText">
                            <xsl:apply-templates/>
                        </span>
                        <span>(</span>
                        <span class="answerLength">
                            <xsl:value-of select="@format"/>
                        </span>
                        <span>)</span>
                    </div>
                </xsl:template>
</xsl:stylesheet>
  