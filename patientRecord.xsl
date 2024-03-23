<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="utf-8"/>
  
  <xsl:template match="/">
    <PatientList>
      <xsl:apply-templates select="MedRecords/PatRec"/>
    </PatientList>
  </xsl:template>
  
  <xsl:template match="PatRec">
    <PatientDemographic>
      <PatientName>
        <xsl:value-of select="concat(Name/LastName, ', ', Name/FirstName, ' ', Name/MiddleName)"/>
      </PatientName>
      <xsl:choose>
        <xsl:when test="Identifier/SSN">
          <SSN>
            <xsl:value-of select="Identifier/SSN"/>
          </SSN>
        </xsl:when>
        <xsl:otherwise>
          <DriverLicense>
            <xsl:value-of select="Identifier/DriverLicense"/>
          </DriverLicense>
        </xsl:otherwise>
      </xsl:choose>
    </PatientDemographic>
    <ServicePerformed>
      <Service>
        <ServiceName>
          <xsl:value-of select="MedTest"/>
        </ServiceName>
        <Date>
          <xsl:value-of select="Date"/>
        </Date>
        <Cost>
          <xsl:value-of select="TestCost"/>
        </Cost>
        <Provider>
          <xsl:value-of select="Lab"/>
        </Provider>
      </Service>
    </ServicePerformed>
  </xsl:template>
</xsl:stylesheet>
