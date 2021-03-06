classdef functionGenerator
    properties
        device
        frequency
        peakToPeak
        offset
        dutyCycle
        impedance
        
    end
    methods
        %functionGenerator , constructor
        %addres -> visa address
        %
        function obj = functionGenerator(address)
            obj.device=visa('agilent', address);
            fopen(obj.device);
            obj.frequency=0;%seteo las variables en cero
            obj.dutyCycle=0;
            obj.offset=0;
            obj.peakToPeak=0;
            obj.impedance=0;
            fprintf(obj.device, 'OUTPut OFF');%apago la salida del generador
            fprintf(obj.device,'OUTPut:LOAD INFinity'); %seteo el generado en alta impedancia
            fprintf(obj.device,'VOLTage:UNIT VPP');%seteo las unidades del generador en volt peak to peak
            fprintf(obj.device,'FUNCtion SINusoid');%forma de onda por defecto la sinusoidal
            
        end
        
        function obj = setFrequency(obj,frequency)
           obj.frequency=frequency;
        end
        
        function obj = setPeakToPeak(obj,peakToPeak)
           obj.peakToPeak=peakToPeak;
        end
        
        function obj = setOffset(obj,offset)
           obj.offset=offset;
        end
        
        function updateSin(obj)
          fprintf(obj.device,['APPL:SIN ',' ', num2str(obj.frequency,3),' ' ,'KHZ,',' ', num2str(obj.peakToPeak,3),' ', 'VPP,',' ', num2str(obj.offset,3),' ', 'V']);
     
        
       
        end
     
        function status = getCurrentStatus(obj)
           status= obj.frequency;
           status=[status,obj.peakToPeak];
           status=[status,obj.offset];
           status=[status,obj.dutyCycle];
        end
       end
    
  
    
end