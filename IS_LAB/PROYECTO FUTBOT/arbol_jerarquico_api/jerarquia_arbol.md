ÁRBOL 🌳 JERÁRQUICO DE RUTAS API

/api/v1/auth/
/register
/login
/logout
/api/v1/users/
/{userId}
/api/v1/teams/
/{teamId}
/name
/logo
/api/v1/players
/api/v1/players/{player_id}
/name
/number	
/api/v1/behaviors
	/{behaviorId}
/api/v1/leagues
	/{leagueId}
		/verify-password
		/teams/
			/{teamId}	
/api/v1/friendly
	/{matchId}
		/teams
/api/v1/matches
	/api/v1/matches/{matchId}
		/teams/
			{teamId}
			    /substitutions
		/players/
			/{playerId}
				/behavior
		/state
		/result
		/live-token

/api/v1/live-token/global

/ws/v1
/global
/matches/{matchId}





Aclaraciones:

FRIENDLY (antes de que el partido exista de verdad) → crear, listar, cancelar, unirse → termina entregando un match_id 

LEAGUES (fixture generado automáticamente) → cada entrada del fixture ya trae su match_id 

↓ ambos convergen en ↓ 

MATCHES/{matchId} (durante y después del partido, sin distinción de origen) → state, substitutions, behavior, result, live-token, websocket

