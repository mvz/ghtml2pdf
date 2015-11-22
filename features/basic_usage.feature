Feature: Basic usage
  As a publisher
  In order to generate PDF files simply
  I want convert and HTML file to PDF format

  Scenario: Generating a simple PDF
    Given a file "input.html" with:
      """
      <html>
        <head>
          <title>I want my PDF</title>
        </head>
        <body>
          <h1>I want my PDF</h1>
          <p>My content is so awesome I want to be able to print it exactly the
          same way for all eternity.</p>
        </body>
      </html>
      """
    When I successfully run `ghtml2pdf input.html output.pdf`
    Then the file "output.pdf" should exist

  Scenario: Command line feedback
    When I run `ghtml2pdf input.html`
    Then it should fail with:
      """
      An output filename is required
      """
