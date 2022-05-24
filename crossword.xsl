<?xml version="1.0"?>
 <xsl:stylesheet version="1.0"
                 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<link rel="stylesheet" type="text/css" href="crossword.css"></link>
<title> <xsl:value-of select="title"/></title>
</head>
<body bgcolor="black" onload="" style="display:inline-flex;flex-wrap:wrap;">
<xsl:template match="title">
   <div class="clueDirectionDiv"><h1 class="clueDirection"><xsl:apply-templates/></h1></div>
   </xsl:template>

   <xsl:template match="content">
    <p align="center" bgcolor="black" height="200px" width="200px">
	<xsl:apply-templates/> </p>
   </xsl:template>

   <xsl:template match="comment">
     <i><xsl:apply-templates/> </i>
   </xsl:template>

    <xsl:template match="grid">
    <div class="clueExpansionBox">
    
    </div>
    <h2>Using the XMLHttpRequest Object</h2>
    <button type="button" onclick="loadXMLDoc()">load xsl file</button>
    <button type="button" onclick="loadXMLDoc2()">load xml file</button>
    <div class="messageBoxHolder" id="messageBox">   
      <span class="consoleBox" id="codePos">CodePosition = </span>
      <span class="consoleBox" id="inputCellNo">userClick Cell No. Cols = </span>
      <span class="consoleBox" id="altInputCellNo">userClick Cell No. Rows = </span>
      <span class="consoleBox" id="cursorPositionCounter">cursorPosInAns = </span>
      <span class="consoleBox" id="cellCounter">iterations = </span>
      <span class="consoleBox" id="wantedClueNumberDisplay">Req Clue = </span>
      <span class="consoleBox" id="acrossOrDownResult"></span>
      <span class="consoleBox" id="lengthOfAcrossAnswerDisplay">Length Across Answer = </span>
      <span class="consoleBox" id="lengthOfDownAnswerDisplay">Length Down Answer = </span>
      <span class="consoleBox" id="trafficLightDisplay">traffic light = </span>
      <button>Submit</button>
      <button>Save</button>
    </div>
	 <div class="crosswordGrid" id="crosswordGrid" 
   style="display:flex;flex-direction:column;justify-content:flex-start;
   flex-wrap:wrap;flex-basis:100%;background-color:black;
          max-width:600px;max-height:600px;min-height:600px;width:600px;">
   <xsl:apply-templates/> </div>
   </xsl:template>

   <xsl:template match="cell">
    <div class="crosswordCell" style="background-color:yellow;
 min-width:40px;min-height:40px;max-height:40px;max-width:40px;padding:none;text-transform:capitalize;">
 <span class="clueNumberInCell"><xsl:value-of select="@number"/></span>
 <input class="letterInput" type="text" maxlength="1" size="1" value="" 
 tabindex="-1" name="" oninput=""></input>
 <span class="yNumberInCell"><xsl:value-of select="@y"/></span>
 <span class="xNumberInCell"><xsl:value-of select="@x"/></span>
 <span class="solution" style="display:none;"><xsl:value-of select="@solution"/></span>
 <xsl:apply-templates/>
	</div>
	</xsl:template>

<xsl:template match="cell[@type='block']">
    <div class="crosswordCell" tabindex="-1" style="background-color:black;
     min-width:40px;min-height:40px;max-height:40px;max-width:40px;">
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
	<span class="clueNumber" id="{generate-id()}"><xsl:value-of select="@number"/></span>
	<span class="clueText">
	 <xsl:apply-templates/></span>
	<span>(</span><span class="answerLength"><xsl:value-of select="@format"/></span><span>)</span>
	</div>
	</xsl:template>
</body>
</html>
   </xsl:template>
 
 </xsl:stylesheet>
  