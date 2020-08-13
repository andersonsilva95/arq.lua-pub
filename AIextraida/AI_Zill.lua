-- AI_zig.lua

ActionList =
{	
	-- 대기
	{
		ID	= "WAIT",
		Motion  = "zig_wait.frm",
		Func	= "zig_WaitFunc",

		Trigger =
		{
			-- 타게팅
			{
				AICheckFrame		= 25,
				AIFunc			= "zig_Check_Targeting",
				DelayFrame		= 110,
			},
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 15,
				AIFunc			= "zig_Check_TurnToTarget",
				DelayFrame		= 15,
			},
			-- 달리기
			{
				AICheckFrame	= 55,
				AIFunc			= "zig_Check_Walk",
				DelayFrame		= 111,
			},
			
			-- 근접콤보공격
			{
				AICheckFrame	= 25,
				AIFunc			= "zig_Check_Attack01",
				DelayFrame		= 50,
			},
			-- 용소환
			{
				AICheckFrame		= 205,
				AIFunc			= "zig_Check_Attack02",
				DelayFrame		= 110,
			},
			-- 파워 웨이브
			{
				AICheckFrame		= 175,
				AIFunc			= "zig_Check_Attack03",
				DelayFrame		= 120,
			},
			-- 대시 공격
			{
				AICheckFrame		= 75,
				AIFunc			= "zig_Check_Attack04",
				DelayFrame		= 110,
			},			
			-- 분노의 칼질 두방
			{
				AICheckFrame		= 155,
				AIFunc			= "zig_Check_Attack05",
				DelayFrame		= 110,
			},			
			
			{
				AICheckFrame		= 100,
				AIFunc			= "zig_Check_JumpUp",
				DelayFrame		= 100,
			},		
			-- 점프다운
			{
				AICheckFrame		= 30,
				AIFunc			= "zig_Check_JumpDown",
				DelayFrame		= 100,
			},
			
		},
	},
	--  걷기
	{
		ID	= "WALK",
		Motion  = "zig_walk.frm",
		Func	= "zig_WalkFunc",
		
		


		Trigger =
		{
			-- 타겟을 향해 턴
			{
				AICheckFrame		= 35,
				AIFunc			= "zig_Check_TurnToTarget",
				DelayFrame		= 35,
			},
			-- 근접콤보공격
			{
				AICheckFrame	= 25,
				AIFunc			= "zig_Check_Attack01",
				DelayFrame		= 50,
			},
			-- 용소환
			{
				AICheckFrame		= 75,
				AIFunc			= "zig_Check_Attack02",
				DelayFrame		= 110,
			},
			-- 파워 웨이브
			{
				AICheckFrame		= 75,
				AIFunc			= "zig_Check_Attack03",
				DelayFrame		= 110,
			},
			-- 대시 공격
			{
				AICheckFrame		= 75,
				AIFunc			= "zig_Check_Attack04",
				DelayFrame		= 110,
			},			
			-- 분노의 칼질 두방
			{
				AICheckFrame		= 75,
				AIFunc			= "zig_Check_Attack05",
				DelayFrame		= 110,
			},			
			-- 멈추기
			{
				AICheckFrame		= 10,
				AIFunc			= "zig_Check_RunStop",
				DelayFrame		= 55,
			},		
			{
				AICheckFrame		= 50,
				AIFunc			= "zig_Check_JumpUp",
				DelayFrame		= 25,
			},		
			-- 점프다운
			{
				AICheckFrame		= 60,
				AIFunc			= "zig_Check_JumpDown",
				DelayFrame		= 25,
			},
		}
	},
	

	-- 근접공격01
	{
		ID	= "ATTACK01",
		Motion  = "zig_double_hit.frm",
		Func	= "zig_Attack01Func",
	},
	
	-- 용소환
	{
		ID	= "ATTACK02",
		Motion  = "zig_calling_dragon.frm",
		Func	= "zig_Attack02Func",
	},
	
	-- 카운트블로우
	{
		ID	= "ATTACK03",
		Motion  = "zig_FireShockWave.frm",
		Func	= "zig_Attack03Func",
	},
	
	-- 필살기??
	{
		ID	= "ATTACK04",
		Motion  = "zig_dash_attack.frm",
		Func	= "zig_Attack04Func",
	},
	
	-- 필살기??
	{
		ID	= "ATTACK05",
		Motion  = "zig_double_slash.frm",
		Func	= "zig_Attack05Func",
	},


	
	-- 점프
	{
		ID	= "JUMP",
		Motion  = "zig_Jump.frm",
		Func	= "zig_JumpFunc",
		
		
	},
	
	-- 점프 다운
	{
		ID	= "JUMPDOWN",
		Motion  = "zig_Jump.frm",
		Func	= "zig_JumpDownFunc",		
		
	},
	
		-- 점프 랜딩
	{
		ID	= "LANDING",
		Motion  = "zig_jump_landing.frm",
		Func	= "zig_LandingFunc",		
		
	},




	-- 데미지 상
	{
		ID	= "DAMAGE_UP",
		Motion  = "zig_damage_up.frm",
		Func	= "zig_DamageFunc",
	},
	
	-- 데미지 하
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "zig_damage_down.frm",
		Func	= "zig_DamageFunc",
	},
	
	-- 죽기01
	{
		ID	= "DIE",
		Motion  = "zig_die.frm",
		Func	= "zig_DieFunc",
	},
	
	-- 스톤커스
	{
		ID	= "STONECURSE",
		Motion  = "zig_stone_Curse.frm",
		Func	= "zig_StoneCurseFunc",
	},
	
	-- 빙결상태
	{
		ID	= "ICECURSE",
		Motion  = "zig_stone_Curse.frm",
		Func	= "zig_IceCurseFunc",
	},
	
	-- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "zig_stone_Curse.frm",
		Func	= "zig_HoldFunc",
	},
	
}

CallBack =
{
	Land	= "Onzig_Land",
	Die	= "Onzig_Die",
	Damage  = "Onzig_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitZill( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	

	pMonster:AddTraceParticleToBone( "Zig_hair_01", 1.0, 5, 7, 5 )
	pMonster:AddTraceParticleToBone( "Zig_hair_02", 1.0, 5, 7, 5 )
	pMonster:AddTraceParticleToBone( "Zig_hair_03", 1.0, 5, 7, 5 )
	pMonster:AddTraceParticleToBone( "Zig_hair_04", 1.0, 5, 7, 5 )
	pMonster:AddTraceParticleToBone( "Zig_hair_05", 1.0, 5, 7, 5 )
    pMonster:SetMeshRender( 2, false )
    pMonster:SetMeshRender( 3, false )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function zig_WaitFunc( iMonsterIndex, iFrame )

	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetMeshRender( 2, false )
	if( iFrame == 1 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if(pMonster:IsSuperArmor() == true) then
			--pMonster:SetSuperArmor( false )
		end		
		pMonster:SetState( "WAIT" )   		
	end
	
end

-- 걷기 상태
function zig_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )		
	if( iFrame == 8 or iFrame == 52 ) then
	    pMonster:CameraVib( 1, 1.0, 0.1 )    
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )		
	end
end


-- 죽는상태
function zig_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:PlaySound(1365)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
		--pMonster:SetState( "WAIT" )
	end
end

-- 데미지 입은거
function zig_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	--pMonster:PlaySound(1036)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


-- 일어나기
function zig_StandUpFunc( iMonsterIndex, iFrame )
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
function zig_Attack01Func( iMonsterIndex, iFrame )
    
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if(iFrame == 1) then
		--pMonster:SetSuperArmor(true)
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetMeshRender( 2, true )
	elseif( iFrame == 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2 )
	elseif( iFrame == 24 ) then
		pMonster:StartAttack( 3,1,0.35, 19, 20, 8)
		pMonster:PlaySound(1137)
	elseif( iFrame == 30 ) then
		pMonster:SetSpeedX( 0 )
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(1137)	
		pMonster:StartAttack( 4,PAR_FRONTDOWN_LAST,0.1, 9, 10, 8)
	elseif( iFrame == 74 ) then
	    pMonster:SkillReadyEffect( 255, 0, 0, 0.1 )
	    pMonster:PlaySound(1361)
    elseif( iFrame == 80 ) then
    	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5 )			
		pMonster:SetDrawSlash( 0 , true )
		pMonster:SetDrawSlash( 1 , true )
		pMonster:StartAttack( 3,PAR_REVERSE_DOWN,0.4, 10, 13, 6)	
		pMonster:StartAttack( 3,PAR_REVERSE_DOWN,0.4, 20, 23, 6)	
	elseif( iFrame == 87 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.9 )
		pMonster:PlaySound(341)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetDrawSlash( 0 , false )
	    pMonster:SetDrawSlash( 1 , false )
	    pMonster:SetMeshRender( 2, false )
		pMonster:SetState( "WAIT" )
	end
end

--  다크크래쉬 상태
function zig_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	 if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0)
		--pMonster:SetSuperArmor( true )				
		pMonster:SetMeshRender( 2, true )
		pMonster:AddDamage(DT_ZIG_SUMMON_DRAGON)			
		pMonster:StartText( "DANGER" )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(1032)				
	elseif( iFrame == 55 ) then		
		pMonster:SkillReadyEffect( 255, 0, 0, 0.5 )
		pMonster:PlaySound(1362)						
		if( pMonster:GetMeshRender( 3 ) == false ) then
		    pMonster:SetMeshRender( 3, true )
		    pMonster:FlashScreen()
                    g_kCamera.WideMode = 7
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
	end
end

--  데스스피어 상태
function zig_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
		

	elseif( iFrame == 11 ) then
		pMonster:SkillReadyEffectNoStop( 100, 100, 100, 0.0 )
		pMonster:PlaySound(1363)				
	elseif( iFrame >= 36 and iFrame < 51 ) then
		
		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_ZIG_BURST_L, 0.4, 0.0 )
		end
		
		if( iFrame == 41 ) then
		
			pMonster:PlaySound( 43 )
			
			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "Fire_Wave_01", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09", 0.4, 0.0 )
			else
				pMonster:AddParticleNoDirection( "Fire_Wave_01_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08_L", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09_L", -0.4, 0.0 )
			end
		end
	elseif( iFrame >= 51 and iFrame < 66 ) then
		
		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_ZIG_BURST_L, 0.9, 0.0 )
		end
		
		if( iFrame == 56 ) then
		
			pMonster:PlaySound( 43 )
			
			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "Fire_Wave_01", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09", 0.9, 0.0 )
			else
				pMonster:AddParticleNoDirection( "Fire_Wave_01_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08_L", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09_L", -0.9, 0.0 )
			end
		end
	elseif( iFrame >= 66 and iFrame < 81 ) then
		
		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_ZIG_BURST_L, 1.4, 0.0 )
		end
		if( iFrame == 71 ) then
		
			pMonster:PlaySound( 43 )
		
			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "Fire_Wave_01", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09", 1.4, 0.0 )
			else
				pMonster:AddParticleNoDirection( "Fire_Wave_01_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_02_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_03_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_04_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_05_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_06_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_07_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_08_L", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "Fire_Wave_09_L", -1.4, 0.0 )
			end
		end
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end


function zig_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	
	 if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0)
		--pMonster:SetSuperArmor( true )
		pMonster:SetMeshRender( 2, true )
		pMonster:SetDrawSlash( 0 , true )
		pMonster:SetDrawSlash( 1 , true )
	elseif( iFrame == 35 ) then
	    pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 9 )
	elseif( iFrame == 36 or iFrame == 48 or iFrame == 60 or iFrame == 72 ) then
	    pMonster:PlaySound( 49 )    
	elseif( iFrame == 57 or iFrame == 68 or iFrame == 84 ) then
	    pMonster:CameraVib( 1, 1.2, 0.1 )     	    
    elseif( iFrame == 69 ) then
        pMonster:PlaySound( 341 )    
        pMonster:StartAttack( 7, PAR_FRONTDOWN_LAST, 0.45, 21, 23, 7 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetMeshRender( 2, false )
		pMonster:SetDrawSlash( 0 , false )
		pMonster:SetDrawSlash( 1 , false )
	end
end


function zig_Attack05Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	
	 if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0)		
		pMonster:SetMeshRender( 2, true )
		pMonster:SetDrawSlash( 0 , true )
		pMonster:SetDrawSlash( 1 , true )	
	elseif( iFrame == 12 ) then	
		pMonster:PlaySound(1364)
    elseif( iFrame == 83 ) then
        pMonster:PlaySound(341)
        pMonster:StartAttack( 7, PAR_FRONTDOWN_LAST, 0.45, 21, 23, 6 )
    elseif( iFrame == 103 ) then
        pMonster:PlaySound(341)
        pMonster:StartAttack( 7, PAR_FRONTDOWN_LAST, 0.45, 11, 13, 5 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetMeshRender( 2, false )
		pMonster:SetDrawSlash( 0 , false )
		pMonster:SetDrawSlash( 1 , false )
	end
end


--  점프 상태
function zig_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end


--  점프다운 상태
function zig_JumpDownFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end



function zig_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


--  회피 상태
function zig_AvoidFunc( iMonsterIndex, iFrame )
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
function zig_StoneCurseFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
		pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
		pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame == 140 ) then
		pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

--  아이스커스 걸렸음
function zig_IceCurseFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor( true )
		pMonster:AddTraceParticle( "IceCurse_medium", 3 )
		pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame == 140 ) then
		pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
		pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
		--pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end


-- 홀드 걸렸음(이펙트)
function zig_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		--pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function zig_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2024, 800, 2024, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function zig_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function zig_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -500, 400, 500, -200 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end




function zig_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -350, 600, 350, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function zig_CheckDownUp02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function zig_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 420, -250, 290, 250, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function zig_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 740, -350, 430, 350, -200 ) == true and 
	    pMonster:GetHP() < pMonster:GetMaxHP() * 0.5  ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function zig_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 440, -250, 450, 250, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function zig_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 540, -350, 330, 350, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end


function zig_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 430, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end



function zig_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 300 ) == true and pMonster:GetIsContact() == true ) then		
	    zig_Process_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function zig_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 250, -260, 0, 300, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMPDOWN" )
		pMonster:ResetDelay()
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onzig_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
    pMonster:CameraVib( 1, 1.2, 0.1 )    
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true or pMonster:CheckState( "JUMPMOVE" ) == true or pMonster:CheckState( "JUMPMOVEATTACK" ) == true or pMonster:CheckState( "AERIALAVOID" ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )	
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )	
	end
end

function Onzig_Die( iMonsterIndex )
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

function Onzig_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.5 ) then
	    if( pMonster:GetMeshRender( 3 ) == false and
	        ( pMonster:CheckState( "WAIT" ) or
	          pMonster:CheckState( "WALK" ) ) ) then
	        pMonster:SetState( "ATTACK02" )
	    end
	end

	
end


function zig_Process_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	local fSpeedX = ( fTargetX - fMonX ) * 1.5
	local fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.7) + pMonster:FloatAbs((fSpeedX / 2.9)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function zig_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(20)
			zig_Process_Jump( iMonsterIndex )
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.5 )
			pMonster:SetSpeedY( 0.018)			
		end
	end
end
