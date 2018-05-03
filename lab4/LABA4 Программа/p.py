from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
 
 
class Calculator(QObject):
    first_operand = ''
    seond_operand = ''
    g=False
    def __init__(self):
        QObject.__init__(self)
      
   
   
    sumResult = pyqtSignal(float, arguments=['sum'])
 
    subResult = pyqtSignal(float, arguments=['sub'])
   
    clear=pyqtSignal(arguments=['C'])

    #def C(self):
     #  self.line.backspace()
    
    @pyqtSlot()
    def is_first(self):
       return True
    
    @pyqtSlot()
    def clear(self):
        self.first_operand=0.0 
        self.g=False
    
   
    @pyqtSlot(float,str)
    def sub(self,c,sign):
         
       
        self.sign=sign
      
        if self.g==False:
            self.first_operand = c
            self.g=True
        else:
            
            #self.first_operand - c
            self.sumResult.emit(self.first_operand - c)
            #self.subResult.emit(self.first_operand - c)
    
    @pyqtSlot(float,str)
    def sum(self,c,sign):
        
        
        self.sign=sign
        if self.g==False:
            self.first_operand = c
            self.g=True
        else:
            #self.first_operand - c
            self.sumResult.emit(self.first_operand + c)
            #self.subResult.emit(self.first_operand - c)
    @pyqtSlot(float,str)
    def unmoj(self,c,sign):
        
        
        self.sign=sign
        if self.g==False:
            self.first_operand = c
            self.g=True
        else:
            #self.first_operand - c
            self.sumResult.emit(self.first_operand * c)
            #self.subResult.emit(self.first_operand - c)
    @pyqtSlot(float,str)
    def delen(self,c,sign):
        
        
        self.sign=sign
        if self.g==False:
            self.first_operand = c
            self.g=True
        else:
            #self.first_operand - c
            #self.ravno(c)
            self.sumResult.emit(self.first_operand / c)
        
        
    @pyqtSlot(float)
    def ravno(self,c):
          
        if self.sign == "-":
            a=self.first_operand - c
            self.sumResult.emit(a)
            
            self.first_operand=a 
        elif self.sign == "+":
            a=self.first_operand + c
            self.sumResult.emit(a)
            
            self.first_operand=a 
        elif self.sign == "*":
            a=self.first_operand * c
            self.sumResult.emit(a)
            
            self.first_operand=a 
        elif self.sign == "/":
            a=self.first_operand / c
            self.sumResult.emit(a)
            
            self.first_operand=a   
            
 
if __name__ == "__main__":
   import sys
 
   
   app = QGuiApplication(sys.argv)
   
   engine = QQmlApplicationEngine()
   
   calculator = Calculator()
   
   engine.rootContext().setContextProperty("calculator", calculator)
   
   engine.load("main.qml")
 
   engine.quit.connect(app.quit)
   sys.exit(app.exec_())
