-- AI_Astarot.lua

ActionList =
{	
	-- 대기
	{
		ID	= "WAIT",
		Motion  = "Astarot_Wait.frm",
		Func	= "Astarot_WaitFunc",

		Trigger =
		{
			-- 타게팅
			{
				AICheckFrame		= 25,
				AIFunc			= "Astarot_Check_Targeting",
				DelayFrame		= 110,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 15,
				AIFunc			= "Astarot_Check_TurnToTarget",
				DelayFrame		= 15,
			},
			---[[
			-- 달리기
			{
				AICheckFrame	= 25,
				AIFunc			= "Astarot_Check_Run",
				DelayFrame		= 55,
			},
			--]]
			---[[
			-- 근접콤보공격
			{
				AICheckFrame	= 35,
				AIFunc			= "Astarot_Check_Attack01",
				DelayFrame		= 55,
			},
			--]]
			---[[
			-- 다크 크래쉬
			{
				AICheckFrame		= 75,
				AIFunc			= "Astarot_Check_Attack02",
				DelayFrame		= 110,
			},
			--]]
			---[[
			-- 다크 퓨리어스
			{
				AICheckFrame		= 110,
				AIFunc			  = "Astarot_Check_Attack05",
				DelayFrame		  = 330,
			},  
			--]]
			---[[
			-- 점프업
			{
				AICheckFrame		= 25,
				AIFunc			= "Astarot_Check_JumpUp",
				DelayFrame		= 25,
			},		
			-- 점프다운
			{
				AICheckFrame		= 25,
				AIFunc			= "Astarot_Check_JumpDown",
				DelayFrame		= 25,
			},
			--]]
		},
	},
	
	--  달리기
	{
		ID	= "RUN",
		Motion  = "Astarot_Run.frm",
		Func	= "Astarot_RunFunc",
		EnableMoveCheck = 1,
		MoveFailFunc	= "Astarot_MoveFail",


		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 35,
				AIFunc			= "Astarot_Check_TurnToTarget",
				DelayFrame		= 35,
			},--[[
			 -- 근접공격01
			{
				AICheckFrame		= 1,
				AIFunc			= "Astarot_Check_Attack01",
				DelayFrame		  = 75,
			},			
			 -- 다크크래쉬
			{
				AICheckFrame		= 30,
				AIFunc			= "Astarot_Check_Attack02",
				DelayFrame		  = 110,
			},		--]]	
			 -- 점프업
			{
				AICheckFrame		= 25,
				AIFunc			= "Astarot_Check_JumpUp",
				DelayFrame		= 25,
			},			
			-- 점프다운
			{
				AICheckFrame		= 25,
				AIFunc			= "Astarot_Check_JumpDown",
				DelayFrame		= 25,
			},	--[[	
			-- 멈추기
			{
				AICheckFrame		= 10,
				AIFunc			= "Astarot_Check_RunStop",
				DelayFrame		= 55,
			},	--]]		
		}
	},
	
	-- 근접공격01
	{
		ID	= "ATTACK01",
		Motion  = "Astarot_Attack01.frm",
		Func	= "Astarot_Attack01Func",
	},
	
	-- 다크크래쉬
	{
		ID	= "ATTACK02",
		Motion  = "Astarot_Attack02.frm",
		Func	= "Astarot_Attack02Func",
	},
	
	-- 드래곤드라이브 준비
	{
		ID	= "ATTACK03READY",
		Motion  = "Astarot_Attack03Ready.frm",
		Func	= "Astarot_Attack03Ready_Func",
	},
	{
		ID	= "ATTACK03",
		Motion  = "Astarot_Attack03.frm",
		Func	= "Astarot_Attack03_Func",
	},
	{
		ID	= "ATTACK03_LANDING",
		Motion  = "Astarot_Attack03_Landing.frm",
		Func	= "Astarot_Attack03Landing_Func",
	},
	
	-- 카운트블로우
	{
		ID	= "ATTACK04",
		Motion  = "Astarot_Attack04.frm",
		Func	= "Astarot_Attack04Func",
	},
	
	-- 다크퓨리어스
	{
		ID	= "ATTACK05",
		Motion  = "Astarot_Attack05.frm",
		Func	= "Astarot_Attack05Func",
	},

	 -- 기상공격
	{
		ID	= "STANDUPATTACK",
		Motion  = "Astarot_StandUpAttack.frm",
		Func	= "Astarot_StandUpAttackFunc",
	},
	
	-- 점프
	{
		ID	= "JUMP",
		Motion  = "Astarot_Jump.frm",
		Func	= "Astarot_JumpFunc",
		
		Trigger =
		{
			--점프공격
			{
				AICheckFrame	= 1,
				AIFunc			= "Astarot_Check_JumpAttack",
				DelayFrame		= 1,
			},
		}
	},

	-- 점프공격
	{
		ID	= "JUMPATTACK",
		Motion  = "Astarot_JumpAttack.frm",
		Func	= "Astarot_JumpAttackFunc",
	},

	-- 데미지 상
	{
		ID	= "DAMAGE_UP",
		Motion  = "Astarot_Damage_Up.frm",
		Func	= "Astarot_DamageFunc",
	},
	
	-- 데미지 하
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "Astarot_Damage_Down.frm",
		Func	= "Astarot_DamageFunc",
	},
	
	-- 다운 상
	{
		ID	= "DOWN_UP01",
		Motion  = "Astarot_Down_Up01.frm",
		Func	= "Astarot_DownUpFunc",
		
		Trigger =
		{
			{
				AICheckFrame		= 1,
				AIFunc			= "Astarot_CheckDownUp02",
				DelayFrame		= 0,
			},
		}
	},
	
	-- 다운 상02
	{
		ID	= "DOWN_UP02",
		Motion  = "Astarot_Down_Up02.frm",
		Func	= "Astarot_DownUp02Func",
		IsFallDownMotion	= TRUE,
	},
	
	-- 다운 상 착지
	{
		ID	= "DOWN_UP_LANDING",
		Motion  = "Astarot_Down_Up03.frm",
		Func	= "Astarot_DownFunc",
		IsFallDownMotion	= TRUE,
		
		Trigger =
		{
			{
				AICheckFrame		= 5,
				AIFunc			= "Astarot_CheckStandup",
				DelayFrame		= 0,
			},
		}
	},
	
	-- 다운 중
	{
		ID	= "DOWN_MIDDLE",
		Motion  = "Astarot_Down_Middle.frm",
		Func	= "Astarot_DownFunc",
		IsFallDownMotion	= TRUE,
		
		Trigger =
		{
			{
				AICheckFrame		= 5,
				AIFunc			= "Astarot_CheckStandup",
				DelayFrame		= 0,
			},
		}
	},
	
	-- 다운 하
	{
		ID	= "DOWN_DOWN",
		Motion  = "Astarot_Down_Middle.frm",
		Func	= "Astarot_DownFunc",
		IsFallDownMotion	= TRUE,
		
		Trigger =
		{
			{
				AICheckFrame		= 5,
				AIFunc			= "Astarot_CheckStandup",
				DelayFrame		= 0,
			},
		}
	},
	
	-- 다운 스페셜
	{
		ID	= "DOWN_SPECIAL",
		Motion  = "Astarot_Down_Special01.frm",
		Func	= "Astarot_DownSpecialFunc",
		IsFallDownMotion	= TRUE,
	},
	
	-- 다운 스페셜 착지
	{
		ID	= "DOWN_SPECIAL_LANDING",
		Motion  = "Astarot_Down_Special02.frm",
		Func	= "Astarot_DownSpecialLandingFunc",
		IsFallDownMotion	= TRUE,
		
		Trigger =
		{
			{
				AICheckFrame		= 5,
				AIFunc			= "Astarot_CheckStandup",
				DelayFrame		= 0,
			},
		}
	},
	
	-- 일어나기
	{
		ID	= "STANDUP",
		Motion  = "Astarot_Standup.frm",
		Func	= "Astarot_StandUpFunc",
		IsFallDownMotion	= TRUE,
	},
	
	-- 죽기01
	{
		ID	= "DIE",
		Motion  = "Astarot_Die01.frm",
		Func	= "Astarot_DieFunc",
	},
	
	-- 죽기02
	{
		ID	= "DIE_LANDING",
		Motion  = "Astarot_Die02.frm",
		Func	= "Astarot_DieFunc",
	},	
   
	-- 스톤커스
	{
		ID	= "STONECURSE",
		Motion  = "Astarot_Stone.frm",
		Func	= "Astarot_StoneCurseFunc",
	},
	
	-- 빙결상태
	{
		ID	= "ICECURSE",
		Motion  = "Astarot_Stone.frm",
		Func	= "Astarot_IceCurseFunc",
	},
	
	-- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Astarot_Stone.frm",
		Func	= "Astarot_HoldFunc",
	},
	
	-- 공중대기
	{
		ID	= "FLYINGWAIT",
		Motion  = "Astarot_FlyWait.frm",
		Func	= "Astarot_FlyingWaitFunc",
	},
	
	-- 공중대기02
	{
		ID	= "FLYINGWAIT02",
		Motion  = "Astarot_FlyWait.frm",
		Func	= "Astarot_FlyingWait02Func",
	},

	-- 파이어레인 준비
	{
		ID	= "FIRERAIN_READY",
		Motion	= "Astarot_FlyWait.frm",
		Func	= "Astarot_DramaFireRainReadyFunc",
	},
	
	-- 파이어레인
	{
		ID	= "FIRERAIN",
		Motion  = "Astarot_FireRain.frm",
		Func	= "Astarot_FireRainFunc",
	},
	
	-- 드라마용 무한 파이어레신 시전
	{
		ID	= "DRAMAFIRERAINREADY",
		Motion  = "Astarot_FireRain.frm",
		Func	= "Astarot_DramaFireRainReadyFunc",
	},
	
	-- 드라마용 무한 파이어레인
	{
		ID	= "DRAMAFIRERAIN",
		Motion  = "Astarot_FlyWait.frm",
		Func	= "Astarot_DramaFireRainFunc",
	},

	-- 소환 모션
	{
		ID	= "SUMMON",
		Motion	= "Astarot_Summon.frm",
		Func	= "Astarot_SummonFunc",
	},

	-- 드라마용 텔레포트
	{
		ID	= "DRAMATELEPORT",
		Motion	= "Astarot_FlyWait.frm",
		Func 	= "Astarot_TeleportFunc",
	},
	
	-- 드라마용 텔레포트
	{
		ID	= "DRAMATELEPORT02",
		Motion	= "Astarot_FlyWait.frm",
		Func 	= "Astarot_Teleport02Func",
	},
}

CallBack =
{
	Land	= "OnAstarot_Land",
	Die	= "OnAstarot_Die",
	Damage  = "OnAstarot_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAstarot( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
	pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,	 "DAMAGE_UP" )
	pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
	pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
	pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,	   "DOWN_UP01" )
	pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
	pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,	 "DOWN_DOWN" )
	pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
	
	pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Astarot_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if(pMonster:IsSuperArmor() == true) then
			pMonster:SetSuperArmor( false )
		end
		
		pMonster:SetState( "WAIT" )   
		
	end
end

function Vanessa_NPC_Shield_Active()

end

function Astarot_DramaFireRainReadyFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetInvincible(true)

	if( iFrame <= 1 ) then
		pMonster:SetIsRight( false )
		pMonster:StartText( "DANGER" )
	end

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DRAMAFIRERAIN" )
	end
end

-- 파이어레인
function Astarot_FireRainFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetIsRight( false )
	pMonster:SetInvincible(true)

	if( iFrame <= 1 ) then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
	elseif iFrame == 64 then
		local vanessa = g_MyD3D:GetMonster( 2 )

		if vanessa:IsLive() == true and vanessa:GetMonsterType() == MON_VANESSA_NPC then
			vanessa:SetState( "ATTACK02" )
		end
	end

	if iFrame == 36 then
		pMonster:PlaySound(1033)
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 3.8, -1 )
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.2, 1 )--
	elseif iFrame == 44 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 3, -1 )
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.1, -0.8 )--
	elseif iFrame == 54 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 2.5, -1 )		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.5, -1 )		
	elseif iFrame == 64 then		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.9, -1 )
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.5, -1 )--
	elseif iFrame == 74 then		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.8, -1 )
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.7, -0.6 )--
	elseif iFrame == 84 then		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.1, -1 )
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -1.2, 1 )--
	end

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "FLYINGWAIT02" )
		pMonster:SetInvincible(true)
	end
end

-- 소환 모션
function Astarot_SummonFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetIsRight( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "FLYINGWAIT02" )
	end
end

-- 드라마용 텔레포트
function Astarot_TeleportFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then		
		pMonster:PlaySound(575)
		pMonster:SetIsRight( false )
		pMonster:SetFly( true )
		pMonster:ToggleRender( false )
		pMonster:AddParticle( "Astarot_Teleport_01", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_02", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_03", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_04", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_05", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_06", 0.0, 0.3 )
		pMonster:SendMonsterKill()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetY(4)
		pMonster:ToggleRender( false )
		pMonster:SetFrameLock( true )
	end
end

-- 드라마용 텔레포트02
function Astarot_Teleport02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then		
		pMonster:PlaySound(1033)
		pMonster:PlaySound(575)
		pMonster:SetIsRight( false )
		pMonster:SetFly( true )
		pMonster:ToggleRender( false )
		pMonster:AddParticle( "Astarot_Teleport_01", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_02", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_03", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_04", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_05", 0.0, 0.3 )
		pMonster:AddParticle( "Astarot_Teleport_06", 0.0, 0.3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetY(4)
		pMonster:ToggleRender( false )
		pMonster:SetFrameLock( true )
	end
end

-- 드라마를 위해서 무한히 파이어 레인 쓰고 있는 상태
function Astarot_DramaFireRainFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetIsRight( false )
	pMonster:SetInvincible(true)

	if iFrame == 1 then
		pMonster:SetIsRight( false )
	elseif iFrame == 2 then		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, -0.5, -0.2 )
	elseif iFrame == 10 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0.5, 0.2 )
	elseif iFrame == 20 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.5, 0.2 )
	elseif iFrame == 30 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.0, -0.2 )		
	elseif iFrame == 40 then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 1.0, 1.0 )		
	elseif iFrame == 50 then		
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL3_METEO_READY, 0, 0.2 )
	end

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DRAMAFIRERAIN" )
	end
end

-- 둥둥 떠서 가만히 있는 상태
function Astarot_FlyingWaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetX(1.75)
		pMonster:SetY(0.5)
		pMonster:SetMeshRender( 1 , false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
		pMonster:SetIsRight( false )
		pMonster:SetFly( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "FLYINGWAIT" )
	end	
	
	pMonster:SetInvincible(true)
end

-- 둥둥 떠서 가만히 있는 상태02
function Astarot_FlyingWait02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetX(4)
		pMonster:SetY(1.7)
		pMonster:SetMeshRender( 1 , false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
		pMonster:SetIsRight( false )
		pMonster:SetFly( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		--pMonster:AddParticle( "Astarot_Shield_01", 0.0, 0.3 )
		--pMonster:AddParticle( "Astarot_Shield_02", 0.0, 0.3 )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "FLYINGWAIT02" )
	end	
	
	pMonster:SetInvincible(true)
end

-- 걷기 상태
function Astarot_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- 달리기 상태
function Astarot_RunFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetRunSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "RUN" )
	end
end

-- 죽는상태
function Astarot_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:PlaySound("969", 0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
		--pMonster:SetState( "WAIT" )
	end
end

-- 데미지 입은거
function Astarot_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	--pMonster:PlaySound(1036)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 다운 상
function Astarot_DownUp01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:SetFrameLock( true )
	end
end

-- 다운 상2
function Astarot_DownUp02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 다운
function Astarot_DownFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 
	end
end

-- 다운 스페셜
function Astarot_DownSpecialFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
	end
end

-- 다운 스페셜 착지
function Astarot_DownSpecialLandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )	
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 	
	end
end

-- 일어나기
function Astarot_StandUpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.008 )
		else
			pMonster:SetSpeedX( -0.008 )
		end	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

--  근접공격01 상태
function Astarot_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if(iFrame == 1) then
		pMonster:SetSuperArmor(true)
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
	elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.4 )
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASTAROT01_01 )		
	elseif( iFrame == 54 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.2 )
	elseif( iFrame == 56 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASTAROT01_01 )		
	elseif( iFrame == 64 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.9 )
	elseif( iFrame == 79 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASTAROT01_01 )		
	elseif( iFrame == 116 ) then
		pMonster:PlaySound(489)
		pMonster:AddDamage( DT_ASTAROT01_02 )
		pMonster:AddParticle( "Astarot_Commbo_01", 0.35, 0.05 )
		pMonster:AddParticle( "Astarot_Commbo_02", 0.35, 0.05 )
		pMonster:AddParticle( "Astarot_Commbo_03", 0.35, 0.05 )
		pMonster:AddParticle( "Astarot_Commbo_04", 0.35, 0.05 )
		pMonster:AddParticle( "Astarot_Commbo_05", 0.35, 0.05 )
		pMonster:AddParticle( "Astarot_Commbo_06", 0.35, 0.05 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  다크크래쉬 상태
function Astarot_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	 if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0)
		pMonster:SetSuperArmor( true )				
	elseif( iFrame == 16 ) then
		pMonster:PlaySound(1031)
		pMonster:PlaySound(1033)
		pMonster:AddParticle( "Astarot_DarkCrash_Charge01", 0.24, 0.4 )
		pMonster:AddParticle( "Astarot_DarkCrash_Charge02", 0.24, 0.4 )
		pMonster:AddParticle( "Astarot_DarkCrash_Charge03", 0.24, 0.4 )
		pMonster:AddParticle( "Astarot_DarkCrash_Charge04", 0.24, 0.4 )
		--pMonster:AddParticle( "Astarot_DarkCrash_Charge05", 0.24, 0.4 )
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(1032)		
		pMonster:AddDamage( DT_ASTAROT02 )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
	end
end

-- 공중 공격 준비 자세 
function Astarot_Attack03Ready_Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then
		--pMonster.fReserveValue=45
		pMonster:SetSuperArmor( true )
		pMonster:SetFly( true )
		pMonster:SetSpeedX( 0.0 )
		 pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:SetFly(FALSE)
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetState( "ATTACK03" )
	end
end

-- 공중 공격 자세 
function Astarot_Attack03_Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( math.mod( iFrame, 10) == 0 ) then
		pMonster:AddDamage( DT_ASTAROT03 )		
	end
	
	if( iFrame == 1 ) then
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddParticleNoDirection( "Astarot_silhouette01", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_special2-1_03", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_Finalattack_03", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_silhouette02", 0.0, 0.0 )
		else
			pMonster:AddParticleNoDirection( "Astarot_silhouette01_L", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_special2-1_03_L", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_Finalattack_03_L", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Astarot_silhouette02_L", 0.0, 0.0 )			
		end
		
		pMonster:PlaySound(620)
		pMonster:PlaySound(1034)
		pMonster:SetSuperArmor( true )
		pMonster:SetFly( false )
		pMonster:SetPushCheck( false )
		 pMonster:SetSpeedX(pMonster:GetWalkSpeed() * 3.4)
		 pMonster:SetSpeedY(-0.08)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
		
end

--  공중 공격 착지 상태
function Astarot_Attack03Landing_Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 )then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( true )
		pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  카운터블로우 상태
function Astarot_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	 if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0)
		pMonster:SetSuperArmor( true )
		pMonster:AddDamage( DT_DEFENCE )	
		pMonster:PlaySound(754)
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(400)
		local arg = KParticleArg()
		arg:Init()
		arg:SetName( "Astarot_CounterBlow_01" )
		arg.fOffsetX = 0.1
		arg.fOffsetY = 0.0
		arg.fDirPosX = 0.02
		pMonster:AddParticleArg( arg )
		arg:Init()
		arg:SetName( "Astarot_CounterBlow_02" )
		arg.fOffsetX = 0.1
		arg.fOffsetY = 0.0
		arg.fDirPosX = 0.02
		pMonster:AddParticleArg( arg )
		pMonster:AddDamage( DT_ASTAROT04 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  다크퓨리어스 상태
function Astarot_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local PositionX = 1.5
     if( iFrame <= 1 ) then
        pMonster:SetSpeedX( 0.0)
        pMonster:SetSuperArmor( true )	
		pMonster:PlaySound(1035)		
	elseif( iFrame == 45 ) then
		--pMonster:SkillReadyEffectNoStop( 200, 200, 200, 0.0 )	
	elseif( iFrame == 55 ) then
		pMonster:AddDamage( DT_ASTAROT05_CIRCLE )
		pMonster:PlaySound(496)
		pMonster:PlaySound(499)
	elseif( iFrame == 95 ) then
		pMonster:PlaySound(497)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.1*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.4*PositionX,0)
	elseif( iFrame == 99 ) then
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.5*PositionX,0)		
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.1*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.2*PositionX,0)
	elseif( iFrame == 103 ) then
		pMonster:PlaySound(497)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.5*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.1*PositionX,0)
	elseif( iFrame == 107 ) then
		pMonster:PlaySound(497)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.2*PositionX,0)		
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.4*PositionX,0)
	elseif( iFrame == 111 ) then
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.3*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.5*PositionX,0)
	elseif( iFrame == 115 ) then
		pMonster:PlaySound(497)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.3*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.2*PositionX,0)
	elseif( iFrame == 119 ) then
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.1*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.3*PositionX,0)
	elseif( iFrame == 123 ) then
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.1*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.4*PositionX,0)
	elseif( iFrame == 127 ) then
		pMonster:PlaySound(497)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.4*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,0.2*PositionX,0)
	elseif( iFrame == 131 ) then
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.5*PositionX,0)
		pMonster:AddDamageWithLocate(DT_ASTAROT05_SWORD,-0.3*PositionX,0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

--  기상공격
function Astarot_StandUpAttackFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 )then
		pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 21 ) then
		pMonster:PlaySound(1)
		pMonster:AddDamage( DT_ASTAROT01_01 )
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASTAROT_STANDUP_ATK )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  점프이동 상태
function Astarot_JumpMoveFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 )then
		pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

--  점프 상태
function Astarot_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

--  점프공격 상태
function Astarot_JumpAttackFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 5 ) then 
		pMonster:PlaySound(561)
		pMonster:PlaySound(244)
		pMonster:AddDamage( DT_ASTAROT_JUMPATK )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

--  회피 상태
function Astarot_AvoidFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then	
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:Turn()		
	end
end

--  석화 상태
function Astarot_StoneCurseFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
		pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame == 140 ) then
		pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

--  아이스커스 걸렸음
function Astarot_IceCurseFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:AddTraceParticle( "IceCurse_medium", 3 )
		pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame == 140 ) then
		pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end


-- 홀드 걸렸음(이펙트)
function Astarot_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Astarot_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -1024, 800, 1024, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Astarot_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Astarot_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -100, 200, 100, -200 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function Astarot_Check_Run( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -350, 600, 350, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function Astarot_CheckDownUp02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Astarot_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 120, -130, 130, 130, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 240, -250, 130, 250, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 200, -100, 150, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_JumpAttack( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( iFrame > 20 and pMonster:GetSpeedY() > 0 and pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	elseif( iFrame > 30 and pMonster:GetSpeedY() < 0 ) then
		if( pMonster:CheckTargetInRange( 300, -150, -150, 150, -300 ) == true or pMonster:CheckTargetInRange( 100, -100, -50, 100, -150 ) == true ) then
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK03READY" )
			pMonster:ResetDelay()
		end
	end
end

function Astarot_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 200, -250, 200, 250, -80 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_JumpMove( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 400, -200, 100, 200, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMPMOVE" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
		pMonster:SetSpeedY( 0.040 )			
		pMonster:ResetDelay()
	end
end

function Astarot_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true ) then
		Astarot_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Astarot_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 250, -260, -40, 260, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Astarot_CheckStandup( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 0, -200, 150, 200, -100 ) == true ) then
			pMonster:SetState( "STANDUPATTACK" )
		else
			pMonster:SetState( "STANDUP" )
		end	
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnAstarot_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true or pMonster:CheckState( "JUMPMOVE" ) == true or pMonster:CheckState( "JUMPMOVEATTACK" ) == true or pMonster:CheckState( "AERIALAVOID" ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WAIT" )
	elseif( pMonster:CheckState( "ATTACK03" ) == true ) then
		pMonster:SetState( "ATTACK03_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )	
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )	
	end
end

function OnAstarot_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnAstarot_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "FLYINGWAIT" ) == true or
		pMonster:CheckState( "FLYINGWAIT02" ) == true or
		pMonster:CheckState( "FIRERAIN_READY" ) == true or
		pMonster:CheckState( "FIRERAIN" ) == true or
		pMonster:CheckState( "DRAMAFIRERAINREADY" ) == true or
		pMonster:CheckState( "DRAMAFIRERAIN" ) == true or
		pMonster:CheckState( "SUMMON" ) == true or
		pMonster:CheckState( "DRAMATELEPORT" ) == true or
		pMonster:CheckState( "DRAMATELEPORT02" ) == true ) then
		return 0;
	end

	print ( "asfasfsa" )
 	pMonster:SetPushCheck( true )

	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		--pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.03 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )				
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.03 )			
			else
				pMonster:SetSpeedX( 0.03 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			if( pMonster:FloatRand() < 0.4 ) then			
				pMonster:TurnToTarget()	
				pMonster:SetState( "ATTACK05" )
				pMonster:SetSuperArmor(true)
			else				
				if( pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
					pMonster:SetState( "ATTACK01" )
					pMonster:SetSuperArmor(true)
				elseif( pMonster:CheckTargetInRange( 0, -300, 200, 300, -100 ) == true ) then					
					pMonster:TurnToTarget()	
					pMonster:SetState( "ATTACK04" )
				elseif( pMonster:CheckTargetInRange( 0, -300, 300, 300, -300 ) == false ) then
					Astarot_Process_Jump( iMonsterIndex )
					pMonster:SetState( "JUMP" )
					pMonster:SetSuperArmor(true)
				end
			end
		end
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
		if( pMonster:FloatRand() < 0.1  ) then
			pMonster:SetState( "ATTACK03READY" )
			pMonster:SetSuperArmor(true)
		end
	end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
end

function Astarot_Process_Jump( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	--pMonster:SetPushCheck( false )

	pMonster:TurnToTarget()
	
	pMonster:SetNoCheckContact( 40 )

	iTargetX = pMonster:GetTargetX()
	iTargetY = pMonster:GetTargetY()
	iX	= pMonster:GetX()
	iY	= pMonster:GetY()

	pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

	if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
		pMonster:SetSpeedY( 0.05 )   -- 동일 y선상에 있을때 이정도가 적당..
	elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
		pMonster:SetSpeedY( 0.056 )   -- 타겟이 조금 높은곳에 있으면..
	elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
		pMonster:SetSpeedY( 0.047 )	-- 타겟이 조금 낮은곳에 있으면..
	elseif( iTargetY - iY >= 0.5 ) then
		pMonster:SetSpeedY( 0.056 )
	elseif( iTargetY - iY < -0.5 ) then
		pMonster:SetSpeedY( 0.041 )
	end
end

function Astarot_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.7) + pMonster:FloatAbs((fSpeedX / 2.9)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Astarot_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(20)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )
			pMonster:SetSpeedY( 0.018)			
		end
	end
end
