-- AI_Gadosen.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Berkas_f_Wait.frm",
        Func    = "Gadosen_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Gadosen_Check_Targeting",
                DelayFrame          = 110,
            },--[[
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Gadosen_Check_ReleaseTarget",
                DelayFrame          = 550,
            },--]]
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Gadosen_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Gadosen_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 데스스워드
            {
                AICheckFrame        = 55,
                AIFunc              = "Gadosen_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 데스스피어
            {
                AICheckFrame        = 55,
                AIFunc              = "Gadosen_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 일섬
            {
                AICheckFrame        = 45,
                AIFunc              = "Gadosen_Check_Attack04",
                DelayFrame          = 220,
            },
            -- 다크스톤커스
            {
                AICheckFrame        = 65,
                AIFunc              = "Gadosen_Check_Attack05",
                DelayFrame          = 220,
            },
            -- 메테오
            {
                AICheckFrame        = 75,
                AIFunc              = "Gadosen_Check_Attack06",
                DelayFrame          = 220,
            },
            -- 이동
            {
                AICheckFrame        = 75,
                AIFunc              = "Gadosen_Check_Move",
                DelayFrame          = 150,
            },--
        },
    },

    -- 이동
    {
        ID      = "MOVE",
        Motion  = "Mon_Berkas_f_Move.frm",
        Func    = "Gadosen_MoveFunc",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Gadosen_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Gadosen_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 일섬
            {
                AICheckFrame        = 35,
                AIFunc              = "Gadosen_Check_Attack04",
                DelayFrame          = 35,
            },
            -- 데스스피어
            {
                AICheckFrame        = 55,
                AIFunc              = "Gadosen_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 정지
            {
                AICheckFrame        = 10,
                AIFunc              = "Gadosen_Check_Stop",
                DelayFrame          = 110,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Berkas_f_Attack02.frm",
        Func    = "Gadosen_Attack01Func",
    },
    
    -- 데스스워드
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Berkas_f_Attack05_01.frm",
        Func    = "Gadosen_Attack02Func",
    },
    
    -- 데스스피어
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Berkas_f_Attack01.frm",
        Func    = "Gadosen_Attack03Func",
    },
    
    -- 일섬
    {
        ID      = "ATTACK04",
        Motion  = "Mon_Berkas_f_Attack05_01.frm",
        Func    = "Gadosen_Attack04Func",
    },
    
    -- 스톤커스
    {
        ID      = "ATTACK05",
        Motion  = "Mon_Berkas_f_Attack03_attack.frm", --teste Mon_Berkas_f_Attack03_attack
        Func    = "Gadosen_Attack05Func",
    },
    
    -- 천지파열(메테오)
    {
        ID      = "ATTACK06",
        Motion  = "Mon_Berkas_f_Attack04_attack.frm", --Mon_Berkas_f_Attack04_attack
        Func    = "Gadosen_Attack06Func",
    },
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Mon_Berkas_f_GroundDamage.frm",
        Func    = "Gadosen_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Mon_Berkas_f_GroundDamage.frm",
        Func    = "Gadosen_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Mon_Berkas_f_Die.frm",
        Func    = "Gadosen_DieFunc",
    },
}

CallBack =
{
    Land    = "OnGadosen_Land",
    Die     = "OnGadosen_Die",
    Damage  = "OnGadosen_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGadosen( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_UP" )
    
    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
--]] 
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Gadosen_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 5
	
	if( iFrame == 70 ) then
		if( pMonster:GetIsRight() ) then
		   pMonster:AddTraceParticleToBone( "Dun_Berkas_Smog", 0.2, 22, 8, 8, -0.15, -0.67, TRUE )
		else 
		   pMonster:AddTraceParticleToBone( "Dun_Berkas_Smog_R", 0.2, 22, 8, 8, 0.15, -0.67, TRUE )
		end	
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function Gadosen_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 5
	
	
	if( pMonster:CheckTargetInRange( 0, -1500, 1000, 1500, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

-- 이동 상태
function Gadosen_MoveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )    
    g_kCamera.WideMode = 5
	
	if( iFrame == 38 ) then
		pMonster:AddDamageWithLocate( DT_BERKASLAIR_MON_BERKAS_WALK, 1.2 )
		if( pMonster:GetIsRight() ) then
		   pMonster:AddTraceParticleToBone( "Dun_Berkas_Smog", 0.2, 22, 8, 8, -0.15, -0.67, TRUE )
		else 
		   pMonster:AddTraceParticleToBone( "Dun_Berkas_Smog_R", 0.2, 22, 8, 8, 0.15, -0.67, TRUE )
		end
	elseif( iFrame == 98 ) then
		pMonster:AddDamageWithLocate( DT_BERKASLAIR_MON_BERKAS_WALK, 2.7 )
	elseif( iFrame == 158 ) then
		pMonster:AddDamageWithLocate( DT_BERKASLAIR_MON_BERKAS_WALK, 1.2 )
	elseif( iFrame == 196 ) then
		pMonster:AddDamageWithLocate( DT_BERKASLAIR_MON_BERKAS_WALK, 2.7 )
	end
	
	if( iFrame == 41 or iFrame == 101 or iFrame == 161 or iFrame == 199 ) then
		pMonster:PlaySound(60011)
	end	
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end
end

--  근접공격01 상태
function Gadosen_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	
	if( iFrame == 5 ) then
		pMonster:PlaySound(633)
	elseif( iFrame == 100 ) then	
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.16, 3.0, true )		
	elseif( iFrame == 110 ) then
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_TAIL_ATK1 )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.20, 3.0, true )
	if( pMonster:GetIsRight() == true ) then
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_01", -2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_02", -2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_03", -2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_04", -2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_05", -2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_06", -2.6, 0.12, 0.5 )
	else
	    pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_01", 2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_02", 2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_03", 2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_04", 2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_05", 2.6, 0.12, 0.5 )
		pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_06", 2.6, 0.12, 0.5 )
    end	
		pMonster:PlaySound(375)
	elseif( iFrame == 120 ) then
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.85, 2.5)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.4, 0.9)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -1.1, 1.8)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -0.7, 1.4)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, -0.3, 0.4)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 0.3, 1.1)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 0.7, 2.1)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.1, 0.7)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.5, 1.7)
		pMonster:AddDamageWithLocate(DT_GOLDEN_SLIMEKING_ATK3, 1.9, 2.7)	
	
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.40, 3.0, true )
	--elseif( iFrame == 125 ) then
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.76, 3.0, true )
	--elseif( iFrame == 135 ) then
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.80, 3.0, true )
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.00, 3.0, true )
	elseif( iFrame == 145 ) then
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_TAIL_ATK2 )	
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.00, 3.0, true )
		--pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.50, 3.0, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  데스스워드공격
function Gadosen_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	if( iFrame == 35 ) then
		pMonster:PlaySound(976)
	elseif( iFrame == 40 ) then
		pMonster:AddDamageWithLocate( DT_ARME4_SPECIAL4_HUGE_METEO, 0.0, 2.7 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end		

--  데스스피어 상태
function Gadosen_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	
	if( iFrame == 41 ) then
		pMonster:StartText("JUMP")
	elseif( iFrame == 100 ) then
		pMonster:PlaySound(60011)
	elseif( iFrame == 114 ) then
		pMonster:EarthQuake( 25, 0.07, 0.2 )
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_01", 2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_02", 2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_03", 2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_04", 2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_05", 2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_06", 2.6, 0.12, 0.5 )
		else
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_01", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_02", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_03", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_04", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_05", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack1_Foot_06", -2.6, 0.12, 0.5 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  일섬 상태
function Gadosen_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	
	if( iFrame == 35 ) then
		pMonster:PlaySound(976)
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_RONAN2_SPECIAL4_DRAGON )
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_01", 0, -0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_02", 0, -0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_03", 0, -0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_04", 0, -0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_05", 0, -0.3, 0.7, 5.0)	
		else
			pMonster:AddDamage( DT_RONAN2_SPECIAL4_DRAGON_R )
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_01", 0, 0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_02", 0, 0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_03", 0, 0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_04", 0, 0.3, 0.7, 5.0)		
			pMonster:AddParticleNoDirectionPos("4th_Ronan2_Start_05", 0, 0.3, 0.7, 5.0)
		end
	elseif( iFrame == 40 ) then	
		pMonster:AddDamage( DT_ZIG_SUMMON_DRAGON )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end    
end
--  다크스톤커스 상태
function Gadosen_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	
	if( iFrame == 1 ) then
		if( pMonster:GetIsRight() == true ) then		
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_01", 2.2, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_02", 2.2, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_03", 2.2, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_04", 2.2, 0.12, 0.5 )
		else
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_01", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_02", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_03", -2.6, 0.12, 0.5 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel_Boss_Foot_04", -2.6, 0.12, 0.5 )
		end
		--pMonster:EarthQuake( 10, 0.0, 0.0 )
		--pMonster:AddDamageWithLocate( DT_BERKASLAIR_MON_BERKAS_ATK3_FOOT, 2.5 )
	elseif( iFrame == 2 ) then
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_STRAIGHT_FRAME1 )
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_STRAIGHT_FRAME2 )
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_STRAIGHT_FRAME3 )
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_STRAIGHT_FRAME4 )
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_01", 3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_02", 3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_03", 3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_04", 3.35, 1.34, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_05", 3.42, 0.9, 0.9 )
		else
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_01", -3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_02", -3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_03", -3.5, 1.2, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_04", -3.35, 1.34, 0.9 )
			pMonster:AddTraceParticleOffset( "Dun_Raid_Berkas_Attack3_Fire_05", -3.5, 0.9, 0.9 )
		end
		pMonster:PlaySound(1291)
		pMonster:PlaySound(60011)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  메테오 상태
function Gadosen_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    g_kCamera.WideMode = 5
	
	if( iFrame == 5 ) then
		pMonster:PlaySound(980001)		
		pMonster:StartText("WIND STORM")		
	elseif( iFrame == 20 ) then
		--pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_WIND_WING )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_01", 0.2, -0.15, 0.5 )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_02", 0.2, -0.15, 0.5 )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_03", 0.2, -0.15, 0.5 )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_01_R", -0.2, -0.15, 0.5 )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_02_R", -0.2, -0.15, 0.5 )
		pMonster:AddParticleNoDirection( "Dun_Raid_Berkas_Attack4_Wind_03_R", 0.2, -0.15, 0.5 )
		pMonster:PlaySound(952)
	elseif( iFrame == 73 ) then
		pMonster:PlaySound(952)		
	elseif( iFrame == 80 ) then
		pMonster:AddDamage( DT_BERKASLAIR_MON_BERKAS_WIND_WING )	
	elseif( iFrame == 120 ) then
		pMonster:PlaySound(952)
		pMonster:PlaySound(60011)
	elseif( iFrame == 145 ) then
		pMonster:PlaySound(60011)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
	
end

-- 죽는상태
function Gadosen_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
	if( iFrame <= 1 ) then	
		pMonster:SetInvincible( true )
		
		if( pMonster:IsBlur() ) then
			if( pMonster:GetIsRight() == true ) then
				g_kCamera:SetTargetOffsetX( 1.0 )
				g_kCamera:SetTargetOffsetY( 1.0 )
			else
				g_kCamera:SetTargetOffsetX( -1.0 )
				g_kCamera:SetTargetOffsetY( 1.0 )
			end
		end
    elseif( iFrame == 5 ) then	
		pMonster:PlaySound(980001)
		pMonster:PlaySound(995036)
	elseif( iFrame == 25 ) then	
		pMonster:PlaySound(995007)
		pMonster:PlaySound(664)
	elseif( iFrame == 150 ) then	
		pMonster:PlaySound(976)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
		pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Gadosen_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Gadosen_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
    if( pMonster:SetTarget( 100, -1800, 600, 1800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gadosen_Check_Move( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, -100 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE" )
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )            
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
    if( pMonster:CheckTargetInRange( -1000, -600, 450, 600, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()		
    end
end

function Gadosen_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
    if( pMonster:CheckTargetInRange( 400, -100, 300, 100, -50 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()		
    end
end

function Gadosen_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
	if( pMonster:CheckTargetInRange( 250, -150, 300, 150, 0 ) == true or pMonster:CheckTargetInRange( 350, -150, 400, 150, 200 ) == true or pMonster:CheckTargetInRange( 450, -150, 550, 150, 350 ) == true or pMonster:CheckTargetInRange( 550, -150, 700, 150, 500 ) == true ) then    
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Gadosen_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
	if( pMonster:CheckTargetInRange( 300, -300, 200, 300, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

-- 다크스톤커스
function Gadosen_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
	if( pMonster:CheckTargetInRange( 1000, -400, 450, 400, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Gadosen_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	g_kCamera.WideMode = 5
	
	if( pMonster:GetCountValue() >= 0 and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGadosen_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
    end    
end

function OnGadosen_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
	pMonster:SetState( "DIE" )
end

function OnGadosen_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	g_kCamera.WideMode = 5
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.66 )
    pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.3 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )	
            pMonster:SetSuperArmor(true)
		else
			pMonster:SetState( "ATTACK05" )	
            pMonster:SetSuperArmor(true)
		end
	end
end