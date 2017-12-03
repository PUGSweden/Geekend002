$question='What is the middle name of Benoit B. Mandelbrot?'
"The B in {0} stands for {0}" -f $question.Substring(27,20) #tar med start från 27 tecken från vänster därefter de nästföljande 20 tecknen 
"The B in {0} stands for {0}" -f -join$question[27..46] #tar 27 tecken trån vänster och vidare till tecken 46 från vänster