TextScaleTest
=============
This is a project to that is being used to determine how scaling works in relation to TextFields.

Tests
--
1. Scale the window larger horizontally only.
    Expected: The TextField stays centered horizontally. 
    Actual: The TextField slowly drifts upward and doesn’t stay exactly centered. 

Notes: TextWidth decreases while TextHeight increases.
What happens when TextWidth goes to zero?

