% = MPPD DOMAIN: CLINGCON ENCODING =================================================================

% Move actions
#include "./action-MPP.clp".

% Order fulfillment (Goal condition)
#include "./goal-D-q.clp".

% Highway constraints
#include "../control/highways.clp".

% Strategy
#include "./strategy-MPP.lp".

% Output conversion
#include "./output-MPPD.lp".
