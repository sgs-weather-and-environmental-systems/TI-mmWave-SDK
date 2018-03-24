<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>

<!-- This is wrong in some way - breaks in Firefox
<xsl:output method="xml" doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
     doctype-public="-//W3C//DTD HTML 4.01//EN"/> 
 -->

<!-- ********************************************************************** -->
<!-- Document -->
<!-- ********************************************************************** -->
<xsl:template match="/toc">
  <html>
    <head>
      <title><xsl:value-of select="@label"/></title>
      <link rel="stylesheet" type="text/css" href="toc.css"/>
      <script language="javascript" type="text/javascript" src="toc.js"/>
    </head>
    <body onmousedown="return false;">
      <ul class="open"><xsl:apply-templates/></ul>
    </body>
  </html>
</xsl:template>

<!-- ********************************************************************** -->
<!-- topic -->
<!-- ********************************************************************** -->
<xsl:template match="topic">
  <xsl:choose>
    <xsl:when test="./topic">
      <li class="closed" onclick="toggle(this)">
        <xsl:call-template name="topic">
          <xsl:with-param name="topic" select="."/>
        </xsl:call-template>
        <ul onclick="cancel(event)"><xsl:apply-templates/></ul>
      </li>
    </xsl:when>
    <xsl:otherwise>
      <li class="leaf">
        <xsl:call-template name="topic">
          <xsl:with-param name="topic" select="."/>
        </xsl:call-template>
      </li>
    </xsl:otherwise>
   </xsl:choose>
</xsl:template>


<xsl:template name="topic">
  <xsl:param name="topic"/>
  <xsl:choose>
    <xsl:when test="$topic/@href">
      <xsl:choose>
        <xsl:when test="substring($topic/@title, 1, string-length('package ')) = 'package '">
          <img src="package.gif" class="toc-img"/>
        </xsl:when>
        <xsl:when test="substring($topic/@title, 1, string-length('module ')) = 'module '">
          <img src="mod-blue.gif" class="toc-img"/>
        </xsl:when>
        <xsl:when test="substring($topic/@title, 1, string-length('metaonly module ')) = 'metaonly module '">
          <img src="mod-red.gif" class="toc-img"/>
        </xsl:when>
        <xsl:when test="substring($topic/@title, 1, string-length('interface ')) = 'interface '">
          <img src="int-blue.gif" class="toc-img"/>
        </xsl:when>
        <xsl:when test="substring($topic/@title, 1, string-length('metaonly interface ')) = 'metaonly interface '">
          <img src="int-red.gif" class="toc-img"/>
        </xsl:when>
      </xsl:choose>
      <a onclick="cancel(event)" href="{$topic/@href}" target="body" title="{$topic/@title}"><span class="{$topic/@class}"><xsl:value-of select="$topic/@label"/></span></a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="substring($topic/@class, 1, string-length('toc-modules')) = 'toc-modules'">
          <img src="modules.gif" class="toc-img"/>
        </xsl:when>
        <xsl:when test="substring($topic/@class, 1, string-length('toc-allmodules')) = 'toc-allmodules'">
        </xsl:when>
        <xsl:otherwise>
          <img src="packages.gif" class="toc-img"/>
        </xsl:otherwise>
      </xsl:choose>
      <span class="noclick" onclick="cancel(event)"><xsl:value-of select="$topic/@label"/></span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
