       IDENTIFICATION DIVISION.
       PROGRAM-ID. MinMaxAverage.
       AUTHOR. Adrien.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MIN   PIC 9(6)V9(6) VALUE HIGH-VALUE.
       01  WS-MAX   PIC 9(6)V9(6) VALUE LOW-VALUE.
       01  WS-AVG   PIC 9(6)V9(6).
       01  WS-TOT   PIC 9(6)V9(6) USAGE IS COMP.
       01  WS-NB    PIC 9(6) VALUE LOW-VALUE.
       01  WS-IN    PIC X(6) VALUE ZEROS.
       01  WS-COUNT PIC 9(10) VALUE ZEROS USAGE IS COMP.

       PROCEDURE DIVISION.
           PERFORM WITH TEST AFTER UNTIL WS-NB EQUAL LOW-VALUE
               PERFORM INPUT-TREATMENT
               PERFORM CALC
           END-PERFORM.
           PERFORM AFFICHAGE.
           STOP RUN.
       
       INPUT-TREATMENT.
           ACCEPT WS-IN.
           IF WS-IN NOT EQUAL SPACES
               MOVE FUNCTION NUMVAL(WS-IN) TO WS-NB 
           ELSE
               MOVE LOW-VALUE TO WS-NB.

        CALC.
           IF WS-NB NOT EQUAL LOW-VALUE
               IF WS-MAX < WS-NB
                   MOVE WS-NB TO WS-MAX
               END-IF
               IF WS-MIN > WS-NB
                   MOVE WS-NB TO WS-MIN
               END-IF
               ADD WS-NB TO WS-TOT
               ADD 1     TO WS-COUNT.

       AFFICHAGE.
           IF WS-COUNT > 0
               COMPUTE WS-AVG = WS-TOT/WS-COUNT
               DISPLAY WS-MIN ' ' WS-MAX ' ' WS-AVG.

