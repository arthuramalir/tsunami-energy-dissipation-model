!                   *****************
                    SUBROUTINE CONDIN
!                   *****************
!
!
!***********************************************************************
! TELEMAC2D   V8P5
!***********************************************************************
!
!brief    INITIALISES THE PHYSICAL PARAMETERS H, U, V ETC.
!
!history  J-M HERVOUET (LNHE)
!+        30/08/2007
!+        V6P0
!+
!
!history  N.DURAND (HRW), S.E.BOURBAN (HRW)
!+        13/07/2010
!+        V6P0
!+   Translation of French comments within the FORTRAN sources into
!+   English comments
!
!history  N.DURAND (HRW), S.E.BOURBAN (HRW)
!+        21/08/2010
!+        V6P0
!+   Creation of DOXYGEN tags for automated documentation and
!+   cross-referencing of the FORTRAN sources
!
!history  M.S.TURNBULL (HRW), N.DURAND (HRW), S.E.BOURBAN (HRW)
!+        06/12/2011
!+        V6P2
!+   Addition of the Tsunami displacement (based on Okada's model)
!+   by calling CONDI_OKADA and of the TPXO tidal model by calling
!+   CONDI_TPXO (the TPXO model being coded in module TPXO)
!
!history  C.-T. PHAM (LNHE)
!+        03/09/2015
!+        V7P1
!+   Change in the number of arguments when calling CONDI_TPXO
!
!history  C.-T. PHAM (EDF, LNHE)
!+        01/08/2017
!+        V7P3
!+   Change in the number of arguments when calling CONDI_TPXO
!
!history  B.GLANDER (BAW)
!+        06/12/2017
!+        V7P2
!+   initialise ZRL variableReferenz Level for Nestor
!
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!
      USE BIEF
      USE DECLARATIONS_TELEMAC
      USE DECLARATIONS_TELEMAC2D
!      USE METEO_TELEMAC, ONLY: PATMOS
!      USE TPXO
      USE OKADA
!
      USE DECLARATIONS_SPECIAL
      IMPLICIT NONE
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
!
!+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
!
      INTEGER ITRAC
!
!
      INTEGER I
!
!-----------------------------------------------------------------------
!
!   INITIALISES THE TIME WITH THE KEYWORD INITIAL TIME FROM V8P5
!
      AT = AT0
!
!-----------------------------------------------------------------------
!
!   INITIALISES THE VELOCITIES: ZERO VELOCITIES
!
      CALL OS('X=0     ',X=U)
      CALL OS('X=0     ',X=V)
      ! USER MODIFICATION
      CALL USER_CONDIN_UV
!
!-----------------------------------------------------------------------
!
!   INITIALISES THE WATER DEPTH H
!
!
!-----------------------------------------------------------------------
!
!   INITIALISES TSUNAMI DISPLACEMENT
!
      IF(OPTTSUNAMI.EQ.1) THEN
        CALL CONDI_OKADA(NPOIN,X,Y,H%R,COETSUNAMI,LAMBD0,PHI0)
      ENDIF
!
!-----------------------------------------------------------------------
!
!   INITIALISES THE TRACERS
!
      IF(NTRAC.GT.0) THEN
        DO ITRAC=1,NTRAC
          CALL OS('X=C     ',X=T%ADR(ITRAC)%P,C=TRAC0(ITRAC))
        ENDDO
      ENDIF
      ! USER MODIFICATION
      CALL USER_CONDIN_TRAC

!
!-----------------------------------------------------------------------
!
!   INITIALISES THE VISCOSITY
!
      CALL OS('X=C     ',X=VISC,C=PROPNU)
!
!-----------------------------------------------------------------------
!
!   INITIALISES THE REFERENCE LEVEL FOR NESTOR
!
      CALL OS('X=C     ',X=ZRL,C=123456789.0D0 )
!-----------------------------------------------------------------------
!
      ! USER MODIFICATION
      CALL USER_CONDIN

      DO I=1,NPOIN
!        HD = DISTAN(X1,Y1,X2,Y2,X(I),Y(I))
        IF(X(I).LT.2.D0) THEN
          H%R(I)=0.2D0
          PRINT *, ZF%R(I)
        ENDIF
        IF (X(I).GT.2.D0) THEN
          H%R(I)=-ZF%R(I)
        ENDIF

!
      ENDDO

!
      RETURN
      END
