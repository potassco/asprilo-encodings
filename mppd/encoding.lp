% = MPPD DOMAIN: BOOLEAN ENCODING ==================================================================

% Move actions
#include "./action-MPP.lp".

% Order fulfillment (Goal condition)
#include "./goal-D-q.lp".

% Highway constraints
#include "../control/highways.lp".

% Strategy
#include "./strategy-MPP.lp"

% Output conversion
#include "./output-MPPD.lp".


