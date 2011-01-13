##################################################################################
## Selleo 2010 - script for xhtml2pdf                                  			##
## Functions accepts pure html tags and css definitions, returns pdf document	##
##################################################################################

import sys
import cStringIO
import getopt

import ho.pisa as pisa          
  
#html - tagi html
#css - definicje css
  
def makePDF(html, css):
  result = cStringIO.StringIO() 
  pdf = pisa.CreatePDF(         
    cStringIO.StringIO(body),
    result
    )
  
  if pdf.err:
      print "Content-Type: text/plain"
      print
      dumpErrors(pdf)
  else:
      print "Content-Type: application/octet-stream"
      print
      sys.stdout.write(result.getvalue())
   
def main(argv):
    html = "no input HTML"
    css = None
    try:
        opts, args = getopt.getopt(argv, "h:c:", ["html=", "css="]) 
    except getopt.GetoptError:           
        usage()                          
        sys.exit(2)
    for opt, arg in opts:   
      if opt in ("-h", "--html"):
        html = arg
      elif opt in ("-c", "--css"):
        css = arg        
    makePDF(html, css)    
        
if __name__ == "__main__":
  pisa.showLogging()
  main(sys.argv[1:])