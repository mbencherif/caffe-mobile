*> \brief \b DORCSD2BY1
*
*  =========== DOCUMENTATION ===========
*
* Online html documentation available at 
*            http://www.netlib.org/lapack/explore-html/ 
*
*> \htmlonly
*> Download DORCSD2BY1 + dependencies
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.tgz?format=tgz&filename=/lapack/lapack_routine/dorcsd2by1.f">
*> [TGZ]</a>
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.zip?format=zip&filename=/lapack/lapack_routine/dorcsd2by1.f">
*> [ZIP]</a>
*> <a href="http://www.netlib.org/cgi-bin/netlibfiles.txt?format=txt&filename=/lapack/lapack_routine/dorcsd2by1.f">
*> [TXT]</a>
*> \endhtmlonly
*
*  Definition:
*  ===========
*
*       SUBROUTINE DORCSD2BY1( JOBU1, JOBU2, JOBV1T, M, P, Q, X11, LDX11,
*                              X21, LDX21, THETA, U1, LDU1, U2, LDU2, V1T,
*                              LDV1T, WORK, LWORK, IWORK, INFO )
* 
*       .. Scalar Arguments ..
*       CHARACTER          JOBU1, JOBU2, JOBV1T
*       INTEGER            INFO, LDU1, LDU2, LDV1T, LWORK, LDX11, LDX21,
*      $                   M, P, Q
*       ..
*       .. Array Arguments ..
*       DOUBLE PRECISION   THETA(*)
*       DOUBLE PRECISION   U1(LDU1,*), U2(LDU2,*), V1T(LDV1T,*), WORK(*),
*      $                   X11(LDX11,*), X21(LDX21,*)
*       INTEGER            IWORK(*)
*       ..
*    
* 
*> \par Purpose:
*> =============
*>
*>\verbatim
*> Purpose:
*> ========
*>
*> DORCSD2BY1 computes the CS decomposition of an M-by-Q matrix X with
*> orthonormal columns that has been partitioned into a 2-by-1 block
*> structure:
*>
*>                                [  I  0  0 ]
*>                                [  0  C  0 ]
*>          [ X11 ]   [ U1 |    ] [  0  0  0 ]
*>      X = [-----] = [---------] [----------] V1**T .
*>          [ X21 ]   [    | U2 ] [  0  0  0 ]
*>                                [  0  S  0 ]
*>                                [  0  0  I ]
*> 
*> X11 is P-by-Q. The orthogonal matrices U1, U2, and V1 are P-by-P,
*> (M-P)-by-(M-P), and Q-by-Q, respectively. C and S are R-by-R
*> nonnegative diagonal matrices satisfying C^2 + S^2 = I, in which
*> R = MIN(P,M-P,Q,M-Q).
*> \endverbatim
*
*  Arguments:
*  ==========
*
*> \param[in] JOBU1
*> \verbatim
*>          JOBU1 is CHARACTER
*>          = 'Y':      U1 is computed;
*>          otherwise:  U1 is not computed.
*> \endverbatim
*>
*> \param[in] JOBU2
*> \verbatim
*>          JOBU2 is CHARACTER
*>          = 'Y':      U2 is computed;
*>          otherwise:  U2 is not computed.
*> \endverbatim
*>
*> \param[in] JOBV1T
*> \verbatim
*>          JOBV1T is CHARACTER
*>          = 'Y':      V1T is computed;
*>          otherwise:  V1T is not computed.
*> \endverbatim
*>
*> \param[in] M
*> \verbatim
*>          M is INTEGER
*>          The number of rows in X.
*> \endverbatim
*>
*> \param[in] P
*> \verbatim
*>          P is INTEGER
*>          The number of rows in X11. 0 <= P <= M.
*> \endverbatim
*>
*> \param[in] Q
*> \verbatim
*>          Q is INTEGER
*>          The number of columns in X11 and X21. 0 <= Q <= M.
*> \endverbatim
*>
*> \param[in,out] X11
*> \verbatim
*>          X11 is DOUBLE PRECISION array, dimension (LDX11,Q)
*>          On entry, part of the orthogonal matrix whose CSD is desired.
*> \endverbatim
*>
*> \param[in] LDX11
*> \verbatim
*>          LDX11 is INTEGER
*>          The leading dimension of X11. LDX11 >= MAX(1,P).
*> \endverbatim
*>
*> \param[in,out] X21
*> \verbatim
*>          X21 is DOUBLE PRECISION array, dimension (LDX21,Q)
*>          On entry, part of the orthogonal matrix whose CSD is desired.
*> \endverbatim
*>
*> \param[in] LDX21
*> \verbatim
*>          LDX21 is INTEGER
*>          The leading dimension of X21. LDX21 >= MAX(1,M-P).
*> \endverbatim
*>
*> \param[out] THETA
*> \verbatim
*>          THETA is DOUBLE PRECISION array, dimension (R), in which R =
*>          MIN(P,M-P,Q,M-Q).
*>          C = DIAG( COS(THETA(1)), ... , COS(THETA(R)) ) and
*>          S = DIAG( SIN(THETA(1)), ... , SIN(THETA(R)) ).
*> \endverbatim
*>
*> \param[out] U1
*> \verbatim
*>          U1 is DOUBLE PRECISION array, dimension (P)
*>          If JOBU1 = 'Y', U1 contains the P-by-P orthogonal matrix U1.
*> \endverbatim
*>
*> \param[in] LDU1
*> \verbatim
*>          LDU1 is INTEGER
*>          The leading dimension of U1. If JOBU1 = 'Y', LDU1 >=
*>          MAX(1,P).
*> \endverbatim
*>
*> \param[out] U2
*> \verbatim
*>          U2 is DOUBLE PRECISION array, dimension (M-P)
*>          If JOBU2 = 'Y', U2 contains the (M-P)-by-(M-P) orthogonal
*>          matrix U2.
*> \endverbatim
*>
*> \param[in] LDU2
*> \verbatim
*>          LDU2 is INTEGER
*>          The leading dimension of U2. If JOBU2 = 'Y', LDU2 >=
*>          MAX(1,M-P).
*> \endverbatim
*>
*> \param[out] V1T
*> \verbatim
*>          V1T is DOUBLE PRECISION array, dimension (Q)
*>          If JOBV1T = 'Y', V1T contains the Q-by-Q matrix orthogonal
*>          matrix V1**T.
*> \endverbatim
*>
*> \param[in] LDV1T
*> \verbatim
*>          LDV1T is INTEGER
*>          The leading dimension of V1T. If JOBV1T = 'Y', LDV1T >=
*>          MAX(1,Q).
*> \endverbatim
*>
*> \param[out] WORK
*> \verbatim
*>          WORK is DOUBLE PRECISION array, dimension (MAX(1,LWORK))
*>          On exit, if INFO = 0, WORK(1) returns the optimal LWORK.
*>          If INFO > 0 on exit, WORK(2:R) contains the values PHI(1),
*>          ..., PHI(R-1) that, together with THETA(1), ..., THETA(R),
*>          define the matrix in intermediate bidiagonal-block form
*>          remaining after nonconvergence. INFO specifies the number
*>          of nonzero PHI's.
*> \endverbatim
*>
*> \param[in] LWORK
*> \verbatim
*>          LWORK is INTEGER
*>          The dimension of the array WORK.
*>
*>          If LWORK = -1, then a workspace query is assumed; the routine
*>          only calculates the optimal size of the WORK array, returns
*>          this value as the first entry of the work array, and no error
*>          message related to LWORK is issued by XERBLA.
*> \endverbatim
*>
*> \param[out] IWORK
*> \verbatim
*>          IWORK is INTEGER array, dimension (M-MIN(P,M-P,Q,M-Q))
*> \endverbatim
*>
*> \param[out] INFO
*> \verbatim
*>          INFO is INTEGER
*>          = 0:  successful exit.
*>          < 0:  if INFO = -i, the i-th argument had an illegal value.
*>          > 0:  DBBCSD did not converge. See the description of WORK
*>                above for details.
*> \endverbatim
*
*> \par References:
*  ================
*>
*>  [1] Brian D. Sutton. Computing the complete CS decomposition. Numer.
*>      Algorithms, 50(1):33-65, 2009.
*
*  Authors:
*  ========
*
*> \author Univ. of Tennessee 
*> \author Univ. of California Berkeley 
*> \author Univ. of Colorado Denver 
*> \author NAG Ltd. 
*
*> \date July 2012
*
*> \ingroup doubleOTHERcomputational
*
*  =====================================================================
      SUBROUTINE DORCSD2BY1( JOBU1, JOBU2, JOBV1T, M, P, Q, X11, LDX11,
     $                       X21, LDX21, THETA, U1, LDU1, U2, LDU2, V1T,
     $                       LDV1T, WORK, LWORK, IWORK, INFO )
*
*  -- LAPACK computational routine (3.5.0) --
*  -- LAPACK is a software package provided by Univ. of Tennessee,    --
*  -- Univ. of California Berkeley, Univ. of Colorado Denver and NAG Ltd..--
*     July 2012
*
*     .. Scalar Arguments ..
      CHARACTER          JOBU1, JOBU2, JOBV1T
      INTEGER            INFO, LDU1, LDU2, LDV1T, LWORK, LDX11, LDX21,
     $                   M, P, Q
*     ..
*     .. Array Arguments ..
      DOUBLE PRECISION   THETA(*)
      DOUBLE PRECISION   U1(LDU1,*), U2(LDU2,*), V1T(LDV1T,*), WORK(*),
     $                   X11(LDX11,*), X21(LDX21,*)
      INTEGER            IWORK(*)
*     ..
*  
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ONE, ZERO
      PARAMETER          ( ONE = 1.0D0, ZERO = 0.0D0 )
*     ..
*     .. Local Scalars ..
      INTEGER            CHILDINFO, I, IB11D, IB11E, IB12D, IB12E,
     $                   IB21D, IB21E, IB22D, IB22E, IBBCSD, IORBDB,
     $                   IORGLQ, IORGQR, IPHI, ITAUP1, ITAUP2, ITAUQ1,
     $                   J, LBBCSD, LORBDB, LORGLQ, LORGLQMIN,
     $                   LORGLQOPT, LORGQR, LORGQRMIN, LORGQROPT,
     $                   LWORKMIN, LWORKOPT, R
      LOGICAL            LQUERY, WANTU1, WANTU2, WANTV1T
*     ..
*     .. External Subroutines ..
      EXTERNAL           DBBCSD, DCOPY, DLACPY, DLAPMR, DLAPMT, DORBDB1,
     $                   DORBDB2, DORBDB3, DORBDB4, DORGLQ, DORGQR,
     $                   XERBLA
*     ..
*     .. External Functions ..
      LOGICAL            LSAME
      EXTERNAL           LSAME
*     ..
*     .. Intrinsic Function ..
      INTRINSIC          INT, MAX, MIN
*     ..
*     .. Executable Statements ..
*
*     Test input arguments
*
      INFO = 0
      WANTU1 = LSAME( JOBU1, 'Y' )
      WANTU2 = LSAME( JOBU2, 'Y' )
      WANTV1T = LSAME( JOBV1T, 'Y' )
      LQUERY = LWORK .EQ. -1
*
      IF( M .LT. 0 ) THEN
         INFO = -4
      ELSE IF( P .LT. 0 .OR. P .GT. M ) THEN
         INFO = -5
      ELSE IF( Q .LT. 0 .OR. Q .GT. M ) THEN
         INFO = -6
      ELSE IF( LDX11 .LT. MAX( 1, P ) ) THEN
         INFO = -8
      ELSE IF( LDX21 .LT. MAX( 1, M-P ) ) THEN
         INFO = -10
      ELSE IF( WANTU1 .AND. LDU1 .LT. P ) THEN
         INFO = -13
      ELSE IF( WANTU2 .AND. LDU2 .LT. M - P ) THEN
         INFO = -15
      ELSE IF( WANTV1T .AND. LDV1T .LT. Q ) THEN
         INFO = -17
      END IF
*
      R = MIN( P, M-P, Q, M-Q )
*
*     Compute workspace
*
*       WORK layout:
*     |-------------------------------------------------------|
*     | LWORKOPT (1)                                          |
*     |-------------------------------------------------------|
*     | PHI (MAX(1,R-1))                                      |
*     |-------------------------------------------------------|
*     | TAUP1 (MAX(1,P))                        | B11D (R)    |
*     | TAUP2 (MAX(1,M-P))                      | B11E (R-1)  |
*     | TAUQ1 (MAX(1,Q))                        | B12D (R)    |
*     |-----------------------------------------| B12E (R-1)  |
*     | DORBDB WORK | DORGQR WORK | DORGLQ WORK | B21D (R)    |
*     |             |             |             | B21E (R-1)  |
*     |             |             |             | B22D (R)    |
*     |             |             |             | B22E (R-1)  |
*     |             |             |             | DBBCSD WORK |
*     |-------------------------------------------------------|
*
      IF( INFO .EQ. 0 ) THEN
         IPHI = 2
         IB11D = IPHI + MAX( 1, R-1 )
         IB11E = IB11D + MAX( 1, R )
         IB12D = IB11E + MAX( 1, R - 1 )
         IB12E = IB12D + MAX( 1, R )
         IB21D = IB12E + MAX( 1, R - 1 )
         IB21E = IB21D + MAX( 1, R )
         IB22D = IB21E + MAX( 1, R - 1 )
         IB22E = IB22D + MAX( 1, R )
         IBBCSD = IB22E + MAX( 1, R - 1 )
         ITAUP1 = IPHI + MAX( 1, R-1 )
         ITAUP2 = ITAUP1 + MAX( 1, P )
         ITAUQ1 = ITAUP2 + MAX( 1, M-P )
         IORBDB = ITAUQ1 + MAX( 1, Q )
         IORGQR = ITAUQ1 + MAX( 1, Q )
         IORGLQ = ITAUQ1 + MAX( 1, Q )
         IF( R .EQ. Q ) THEN
            CALL DORBDB1( M, P, Q, X11, LDX11, X21, LDX21, THETA, 0, 0,
     $                    0, 0, WORK, -1, CHILDINFO )
            LORBDB = INT( WORK(1) )
            IF( P .GE. M-P ) THEN
               CALL DORGQR( P, P, Q, U1, LDU1, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, P )
               LORGQROPT = INT( WORK(1) )
            ELSE
               CALL DORGQR( M-P, M-P, Q, U2, LDU2, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, M-P )
               LORGQROPT = INT( WORK(1) )
            END IF
            CALL DORGLQ( MAX(0,Q-1), MAX(0,Q-1), MAX(0,Q-1), V1T, LDV1T,
     $                   0, WORK(1), -1, CHILDINFO )
            LORGLQMIN = MAX( 1, Q-1 )
            LORGLQOPT = INT( WORK(1) )
            CALL DBBCSD( JOBU1, JOBU2, JOBV1T, 'N', 'N', M, P, Q, THETA,
     $                   0, U1, LDU1, U2, LDU2, V1T, LDV1T, 0, 1, 0, 0,
     $                   0, 0, 0, 0, 0, 0, WORK(1), -1, CHILDINFO )
            LBBCSD = INT( WORK(1) )
         ELSE IF( R .EQ. P ) THEN
            CALL DORBDB2( M, P, Q, X11, LDX11, X21, LDX21, THETA, 0, 0,
     $                    0, 0, WORK(1), -1, CHILDINFO )
            LORBDB = INT( WORK(1) )
            IF( P-1 .GE. M-P ) THEN
               CALL DORGQR( P-1, P-1, P-1, U1(2,2), LDU1, 0, WORK(1),
     $                      -1, CHILDINFO )
               LORGQRMIN = MAX( 1, P-1 )
               LORGQROPT = INT( WORK(1) )
            ELSE
               CALL DORGQR( M-P, M-P, Q, U2, LDU2, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, M-P )
               LORGQROPT = INT( WORK(1) )
            END IF
            CALL DORGLQ( Q, Q, R, V1T, LDV1T, 0, WORK(1), -1,
     $                   CHILDINFO )
            LORGLQMIN = MAX( 1, Q )
            LORGLQOPT = INT( WORK(1) )
            CALL DBBCSD( JOBV1T, 'N', JOBU1, JOBU2, 'T', M, Q, P, THETA,
     $                   0, V1T, LDV1T, 0, 1, U1, LDU1, U2, LDU2, 0, 0,
     $                   0, 0, 0, 0, 0, 0, WORK(1), -1, CHILDINFO )
            LBBCSD = INT( WORK(1) )
         ELSE IF( R .EQ. M-P ) THEN
            CALL DORBDB3( M, P, Q, X11, LDX11, X21, LDX21, THETA, 0, 0,
     $                    0, 0, WORK(1), -1, CHILDINFO )
            LORBDB = INT( WORK(1) )
            IF( P .GE. M-P-1 ) THEN
               CALL DORGQR( P, P, Q, U1, LDU1, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, P )
               LORGQROPT = INT( WORK(1) )
            ELSE
               CALL DORGQR( M-P-1, M-P-1, M-P-1, U2(2,2), LDU2, 0,
     $                      WORK(1), -1, CHILDINFO )
               LORGQRMIN = MAX( 1, M-P-1 )
               LORGQROPT = INT( WORK(1) )
            END IF
            CALL DORGLQ( Q, Q, R, V1T, LDV1T, 0, WORK(1), -1,
     $                   CHILDINFO )
            LORGLQMIN = MAX( 1, Q )
            LORGLQOPT = INT( WORK(1) )
            CALL DBBCSD( 'N', JOBV1T, JOBU2, JOBU1, 'T', M, M-Q, M-P,
     $                   THETA, 0, 0, 1, V1T, LDV1T, U2, LDU2, U1, LDU1,
     $                   0, 0, 0, 0, 0, 0, 0, 0, WORK(1), -1,
     $                   CHILDINFO )
            LBBCSD = INT( WORK(1) )
         ELSE
            CALL DORBDB4( M, P, Q, X11, LDX11, X21, LDX21, THETA, 0, 0,
     $                    0, 0, 0, WORK(1), -1, CHILDINFO )
            LORBDB = M + INT( WORK(1) )
            IF( P .GE. M-P ) THEN
               CALL DORGQR( P, P, M-Q, U1, LDU1, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, P )
               LORGQROPT = INT( WORK(1) )
            ELSE
               CALL DORGQR( M-P, M-P, M-Q, U2, LDU2, 0, WORK(1), -1,
     $                      CHILDINFO )
               LORGQRMIN = MAX( 1, M-P )
               LORGQROPT = INT( WORK(1) )
            END IF
            CALL DORGLQ( Q, Q, Q, V1T, LDV1T, 0, WORK(1), -1,
     $                   CHILDINFO )
            LORGLQMIN = MAX( 1, Q )
            LORGLQOPT = INT( WORK(1) )
            CALL DBBCSD( JOBU2, JOBU1, 'N', JOBV1T, 'N', M, M-P, M-Q,
     $                   THETA, 0, U2, LDU2, U1, LDU1, 0, 1, V1T, LDV1T,
     $                   0, 0, 0, 0, 0, 0, 0, 0, WORK(1), -1,
     $                   CHILDINFO )
            LBBCSD = INT( WORK(1) )
         END IF
         LWORKMIN = MAX( IORBDB+LORBDB-1,
     $                   IORGQR+LORGQRMIN-1,
     $                   IORGLQ+LORGLQMIN-1,
     $                   IBBCSD+LBBCSD-1 )
         LWORKOPT = MAX( IORBDB+LORBDB-1,
     $                   IORGQR+LORGQROPT-1,
     $                   IORGLQ+LORGLQOPT-1,
     $                   IBBCSD+LBBCSD-1 )
         WORK(1) = LWORKOPT
         IF( LWORK .LT. LWORKMIN .AND. .NOT.LQUERY ) THEN
            INFO = -19
         END IF
      END IF
      IF( INFO .NE. 0 ) THEN
         CALL XERBLA( 'DORCSD2BY1', -INFO )
         RETURN
      ELSE IF( LQUERY ) THEN
         RETURN
      END IF
      LORGQR = LWORK-IORGQR+1
      LORGLQ = LWORK-IORGLQ+1
*
*     Handle four cases separately: R = Q, R = P, R = M-P, and R = M-Q,
*     in which R = MIN(P,M-P,Q,M-Q)
*
      IF( R .EQ. Q ) THEN
*
*        Case 1: R = Q
*
*        Simultaneously bidiagonalize X11 and X21
*
         CALL DORBDB1( M, P, Q, X11, LDX11, X21, LDX21, THETA,
     $                 WORK(IPHI), WORK(ITAUP1), WORK(ITAUP2),
     $                 WORK(ITAUQ1), WORK(IORBDB), LORBDB, CHILDINFO )
*
*        Accumulate Householder reflectors
*
         IF( WANTU1 .AND. P .GT. 0 ) THEN
            CALL DLACPY( 'L', P, Q, X11, LDX11, U1, LDU1 )
            CALL DORGQR( P, P, Q, U1, LDU1, WORK(ITAUP1), WORK(IORGQR),
     $                   LORGQR, CHILDINFO )
         END IF
         IF( WANTU2 .AND. M-P .GT. 0 ) THEN
            CALL DLACPY( 'L', M-P, Q, X21, LDX21, U2, LDU2 )
            CALL DORGQR( M-P, M-P, Q, U2, LDU2, WORK(ITAUP2),
     $                   WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTV1T .AND. Q .GT. 0 ) THEN
            V1T(1,1) = ONE
            DO J = 2, Q
               V1T(1,J) = ZERO
               V1T(J,1) = ZERO
            END DO
            CALL DLACPY( 'U', Q-1, Q-1, X21(1,2), LDX21, V1T(2,2),
     $                   LDV1T )
            CALL DORGLQ( Q-1, Q-1, Q-1, V1T(2,2), LDV1T, WORK(ITAUQ1),
     $                   WORK(IORGLQ), LORGLQ, CHILDINFO )
         END IF
*   
*        Simultaneously diagonalize X11 and X21.
*   
         CALL DBBCSD( JOBU1, JOBU2, JOBV1T, 'N', 'N', M, P, Q, THETA,
     $                WORK(IPHI), U1, LDU1, U2, LDU2, V1T, LDV1T, 0, 1,
     $                WORK(IB11D), WORK(IB11E), WORK(IB12D),
     $                WORK(IB12E), WORK(IB21D), WORK(IB21E),
     $                WORK(IB22D), WORK(IB22E), WORK(IBBCSD), LBBCSD,
     $                CHILDINFO )
*   
*        Permute rows and columns to place zero submatrices in
*        preferred positions
*
         IF( Q .GT. 0 .AND. WANTU2 ) THEN
            DO I = 1, Q
               IWORK(I) = M - P - Q + I
            END DO
            DO I = Q + 1, M - P
               IWORK(I) = I - Q
            END DO
            CALL DLAPMT( .FALSE., M-P, M-P, U2, LDU2, IWORK )
         END IF
      ELSE IF( R .EQ. P ) THEN
*
*        Case 2: R = P
*
*        Simultaneously bidiagonalize X11 and X21
*
         CALL DORBDB2( M, P, Q, X11, LDX11, X21, LDX21, THETA,
     $                 WORK(IPHI), WORK(ITAUP1), WORK(ITAUP2),
     $                 WORK(ITAUQ1), WORK(IORBDB), LORBDB, CHILDINFO )
*
*        Accumulate Householder reflectors
*
         IF( WANTU1 .AND. P .GT. 0 ) THEN
            U1(1,1) = ONE
            DO J = 2, P
               U1(1,J) = ZERO
               U1(J,1) = ZERO
            END DO
            CALL DLACPY( 'L', P-1, P-1, X11(2,1), LDX11, U1(2,2), LDU1 )
            CALL DORGQR( P-1, P-1, P-1, U1(2,2), LDU1, WORK(ITAUP1),
     $                   WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTU2 .AND. M-P .GT. 0 ) THEN
            CALL DLACPY( 'L', M-P, Q, X21, LDX21, U2, LDU2 )
            CALL DORGQR( M-P, M-P, Q, U2, LDU2, WORK(ITAUP2),
     $                   WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTV1T .AND. Q .GT. 0 ) THEN
            CALL DLACPY( 'U', P, Q, X11, LDX11, V1T, LDV1T )
            CALL DORGLQ( Q, Q, R, V1T, LDV1T, WORK(ITAUQ1),
     $                   WORK(IORGLQ), LORGLQ, CHILDINFO )
         END IF
*   
*        Simultaneously diagonalize X11 and X21.
*   
         CALL DBBCSD( JOBV1T, 'N', JOBU1, JOBU2, 'T', M, Q, P, THETA,
     $                WORK(IPHI), V1T, LDV1T, 0, 1, U1, LDU1, U2, LDU2,
     $                WORK(IB11D), WORK(IB11E), WORK(IB12D),
     $                WORK(IB12E), WORK(IB21D), WORK(IB21E),
     $                WORK(IB22D), WORK(IB22E), WORK(IBBCSD), LBBCSD,
     $                CHILDINFO )
*   
*        Permute rows and columns to place identity submatrices in
*        preferred positions
*
         IF( Q .GT. 0 .AND. WANTU2 ) THEN
            DO I = 1, Q
               IWORK(I) = M - P - Q + I
            END DO
            DO I = Q + 1, M - P
               IWORK(I) = I - Q
            END DO
            CALL DLAPMT( .FALSE., M-P, M-P, U2, LDU2, IWORK )
         END IF
      ELSE IF( R .EQ. M-P ) THEN
*
*        Case 3: R = M-P
*
*        Simultaneously bidiagonalize X11 and X21
*
         CALL DORBDB3( M, P, Q, X11, LDX11, X21, LDX21, THETA,
     $                 WORK(IPHI), WORK(ITAUP1), WORK(ITAUP2),
     $                 WORK(ITAUQ1), WORK(IORBDB), LORBDB, CHILDINFO )
*
*        Accumulate Householder reflectors
*
         IF( WANTU1 .AND. P .GT. 0 ) THEN
            CALL DLACPY( 'L', P, Q, X11, LDX11, U1, LDU1 )
            CALL DORGQR( P, P, Q, U1, LDU1, WORK(ITAUP1), WORK(IORGQR),
     $                   LORGQR, CHILDINFO )
         END IF
         IF( WANTU2 .AND. M-P .GT. 0 ) THEN
            U2(1,1) = ONE
            DO J = 2, M-P
               U2(1,J) = ZERO
               U2(J,1) = ZERO
            END DO
            CALL DLACPY( 'L', M-P-1, M-P-1, X21(2,1), LDX21, U2(2,2),
     $                   LDU2 )
            CALL DORGQR( M-P-1, M-P-1, M-P-1, U2(2,2), LDU2,
     $                   WORK(ITAUP2), WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTV1T .AND. Q .GT. 0 ) THEN
            CALL DLACPY( 'U', M-P, Q, X21, LDX21, V1T, LDV1T )
            CALL DORGLQ( Q, Q, R, V1T, LDV1T, WORK(ITAUQ1),
     $                   WORK(IORGLQ), LORGLQ, CHILDINFO )
         END IF
*   
*        Simultaneously diagonalize X11 and X21.
*   
         CALL DBBCSD( 'N', JOBV1T, JOBU2, JOBU1, 'T', M, M-Q, M-P,
     $                THETA, WORK(IPHI), 0, 1, V1T, LDV1T, U2, LDU2, U1,
     $                LDU1, WORK(IB11D), WORK(IB11E), WORK(IB12D),
     $                WORK(IB12E), WORK(IB21D), WORK(IB21E),
     $                WORK(IB22D), WORK(IB22E), WORK(IBBCSD), LBBCSD,
     $                CHILDINFO )
*   
*        Permute rows and columns to place identity submatrices in
*        preferred positions
*
         IF( Q .GT. R ) THEN
            DO I = 1, R
               IWORK(I) = Q - R + I
            END DO
            DO I = R + 1, Q
               IWORK(I) = I - R
            END DO
            IF( WANTU1 ) THEN
               CALL DLAPMT( .FALSE., P, Q, U1, LDU1, IWORK )
            END IF
            IF( WANTV1T ) THEN
               CALL DLAPMR( .FALSE., Q, Q, V1T, LDV1T, IWORK )
            END IF
         END IF
      ELSE
*
*        Case 4: R = M-Q
*
*        Simultaneously bidiagonalize X11 and X21
*
         CALL DORBDB4( M, P, Q, X11, LDX11, X21, LDX21, THETA,
     $                 WORK(IPHI), WORK(ITAUP1), WORK(ITAUP2),
     $                 WORK(ITAUQ1), WORK(IORBDB), WORK(IORBDB+M),
     $                 LORBDB-M, CHILDINFO )
*
*        Accumulate Householder reflectors
*
         IF( WANTU1 .AND. P .GT. 0 ) THEN
            CALL DCOPY( P, WORK(IORBDB), 1, U1, 1 )
            DO J = 2, P
               U1(1,J) = ZERO
            END DO
            CALL DLACPY( 'L', P-1, M-Q-1, X11(2,1), LDX11, U1(2,2),
     $                   LDU1 )
            CALL DORGQR( P, P, M-Q, U1, LDU1, WORK(ITAUP1),
     $                   WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTU2 .AND. M-P .GT. 0 ) THEN
            CALL DCOPY( M-P, WORK(IORBDB+P), 1, U2, 1 )
            DO J = 2, M-P
               U2(1,J) = ZERO
            END DO
            CALL DLACPY( 'L', M-P-1, M-Q-1, X21(2,1), LDX21, U2(2,2),
     $                   LDU2 )
            CALL DORGQR( M-P, M-P, M-Q, U2, LDU2, WORK(ITAUP2),
     $                   WORK(IORGQR), LORGQR, CHILDINFO )
         END IF
         IF( WANTV1T .AND. Q .GT. 0 ) THEN
            CALL DLACPY( 'U', M-Q, Q, X21, LDX21, V1T, LDV1T )
            CALL DLACPY( 'U', P-(M-Q), Q-(M-Q), X11(M-Q+1,M-Q+1), LDX11,
     $                   V1T(M-Q+1,M-Q+1), LDV1T )
            CALL DLACPY( 'U', -P+Q, Q-P, X21(M-Q+1,P+1), LDX21,
     $                   V1T(P+1,P+1), LDV1T )
            CALL DORGLQ( Q, Q, Q, V1T, LDV1T, WORK(ITAUQ1),
     $                   WORK(IORGLQ), LORGLQ, CHILDINFO )
         END IF
*   
*        Simultaneously diagonalize X11 and X21.
*   
         CALL DBBCSD( JOBU2, JOBU1, 'N', JOBV1T, 'N', M, M-P, M-Q,
     $                THETA, WORK(IPHI), U2, LDU2, U1, LDU1, 0, 1, V1T,
     $                LDV1T, WORK(IB11D), WORK(IB11E), WORK(IB12D),
     $                WORK(IB12E), WORK(IB21D), WORK(IB21E),
     $                WORK(IB22D), WORK(IB22E), WORK(IBBCSD), LBBCSD,
     $                CHILDINFO )
*   
*        Permute rows and columns to place identity submatrices in
*        preferred positions
*
         IF( P .GT. R ) THEN
            DO I = 1, R
               IWORK(I) = P - R + I
            END DO
            DO I = R + 1, P
               IWORK(I) = I - R
            END DO
            IF( WANTU1 ) THEN
               CALL DLAPMT( .FALSE., P, P, U1, LDU1, IWORK )
            END IF
            IF( WANTV1T ) THEN
               CALL DLAPMR( .FALSE., P, Q, V1T, LDV1T, IWORK )
            END IF
         END IF
      END IF
*
      RETURN
*
*     End of DORCSD2BY1
*
      END

