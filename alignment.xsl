<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="html" indent="yes"/>
    
<!--    Change name of the variables (atribute @name) and of the path to the files (value inside the parentheses of doc() )-->
    <xsl:variable name="nahuatl" select="doc('source/Nahuatl-NT.xml')//text"/>
    <xsl:variable name="tagalog" select="doc('source/Tagalog.xml')//text"/>
    <xsl:template match="/">
        
<!--        The name of the output file is the value inside @href -->     
        <xsl:result-document href="bible.html">
            <html>
                <head>
                    <title>Bible alignment</title>
                    <style>
                        table {
                        border-collapse: collapse;
                        }
                        
                        table, th, td {
                        border: 1px solid black;
                        }
                    </style>
                </head>
                <body>
                    <xsl:apply-templates select="//text"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="body/div">
        <h2>Book <xsl:value-of select="substring(@id, 3)"/></h2>
        <table>
            <thead>
                <tr>
                    
<!--                    Update table header with new languages. 
                    Add <td> elements as needed -->                 
                    <th>English</th>
                    <th>Nauatl</th>
                    <th>Tagalog</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="descendant::seg"/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="seg">
        <tr class="{@id}">
            <td>
                <xsl:apply-templates/>
            </td>
            
<!--            Change name of variables acording to the declaration made above inside <xsl:variable>
            Add <td> elements as needed
            -->
            
            <td>
                <xsl:value-of select="$nahuatl//seg[@id eq current()/@id]"/>
            </td>
            <td>
                <xsl:value-of select="$tagalog//seg[@id eq current()/@id]"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
