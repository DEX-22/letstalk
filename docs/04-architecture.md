# Architecture

The application follows Feature First Architecture.

modules/

auth/

rooms/

participants/

sessions/

cards/

topics/

timer/

dashboard/

shared/

components/

ui/

types/

utils/

Every module must contain:

components/

stores/

services/

repositories/

types/

validators/

composables/

Business logic must never exist inside Vue components.

Repositories communicate with Supabase.

Services contain business logic.

Stores only manage state.
