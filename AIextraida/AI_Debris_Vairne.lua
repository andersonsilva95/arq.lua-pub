-- AI_vairne.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "vairne_Wait.frm",
        Func    = "vairne_WaitFunc",

        Trigger =
        {
        
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "vairne_Check_Targeting",
                DelayFrame          = 200,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 300,
            --    AIFunc              = "vairne_Check_ReleaseTarget",
            --    DelayFrame          = 200,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "vairne_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- 이동 [50%]
            {
                AICheckFrame        = 110,
                AIFunc              = "vairne_Check_Run",
                DelayFrame          = 150,
            },

            -- 점프업
            {
                AICheckFrame        = 102,
                AIFunc              = "vairne_Check_JumpUp",
                DelayFrame          = 220,
            },        

            -- 점프다운
            {
                AICheckFrame        = 51,
                AIFunc              = "vairne_Check_JumpDown",
                DelayFrame          = 110,
            },

			-- 다크볼
            {
                AICheckFrame        = 110,
                AIFunc              = "vairne_Check_Attack01",
                DelayFrame          = 220,
            },

            -- 베큠 필라 [50%]
            {
                AICheckFrame        = 330,
                AIFunc              = "vairne_Check_Attack02",
                DelayFrame          = 440,
            },

            -- 파이브 스타( 상단 )
            {
                AICheckFrame        = 20,
                AIFunc              = "vairne_Check_Attack03",
                DelayFrame          = 190,
            },

             -- 파이브 스타( 하단 )
            {
                AICheckFrame        = 20,
                AIFunc              = "vairne_Check_Attack04",
                DelayFrame          = 190,
            },

            -- 데들리핸드
            {
                AICheckFrame        = 100,
                AIFunc              = "vairne_Check_Attack05",
                DelayFrame          = 100,
            },

            -- 데몬 드랍 (반격으로 사용)
            --{
            --    AICheckFrame        = 550,
            --    AIFunc              = "vairne_Check_Attack06",
            --    DelayFrame          = 1100,
            --},

        },
    },

    -- 이동
    {
        ID              = "RUN",
        Motion          = "vairne_move.frm",
        Func            = "vairne_runFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "vairne_MoveFail",


        Trigger =
        {
			-- 타게팅
			--{
            --    AICheckFrame        = 20,
            --    AIFunc              = "vairne_Check_Targeting",
            --    DelayFrame          = 200,
            --},
            -- 타겟지움
            --{
            --    AICheckFrame        = 200,
            --    AIFunc              = "vairne_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},
			-- 타겟을 향해 턴
            --{
            --    AICheckFrame        = 10,
            --    AIFunc              = "vairne_Check_TurnToTarget",
            --    DelayFrame          = 10,
            --},

            -- 멈추기
            {
                AICheckFrame        = 50,
                AIFunc              = "vairne_Check_Stop",
                DelayFrame          = 25,
            },
        }
    },
        
    -- 다크볼 
    {
        ID      = "ATTACK01",
        Motion  = "vairne_Attack01.frm",
        Func    = "vairne_Attack01Func",
    },
    
    -- 베큠 필라
    {
        ID      = "ATTACK02",
        Motion  = "vairne_Attack02.frm",
        Func    = "vairne_Attack02Func",
    },
	
	-- 파이브 스타 ( 상단 )
    {
        ID      = "ATTACK03_L",
        Motion  = "vairne_Attack03_A.frm",
        Func    = "vairne_Attack03Func",
    },
	
    -- 파이브 스타 ( 상단 )
    {
        ID      = "ATTACK03_R",
        Motion  = "vairne_Attack03_B.frm",
        Func    = "vairne_Attack03Func",
    },
    
    -- 파이브 스타 ( 하단 )
    {
        ID      = "ATTACK04_L",
        Motion  = "vairne_Attack04_A.frm",
        Func    = "vairne_Attack04Func",
    },
	
    -- 파이브 스타 ( 상단 )
    {
        ID      = "ATTACK04_R",
        Motion  = "vairne_Attack04_B.frm",
        Func    = "vairne_Attack04Func",
    },
	
	-- 
    {
        ID      = "ATTACK05",
        Motion  = "vairne_attack05_01.frm",
        Func    = "vairne_Attack05_1Func",
    },
	
	-- 
    {
        ID      = "ATTACK05_2",
        Motion  = "vairne_attack05_02.frm",
        Func    = "vairne_Attack05_2Func",
    },
	
	-- 
    {
        ID      = "ATTACK06_L",
        Motion  = "vairne_attack06_A_01.frm",
        Func    = "vairne_Attack06_Func",
    },
	
	-- 
    {
        ID      = "ATTACK06_2_L",
        Motion  = "vairne_attack06_A_02.frm",
        Func    = "vairne_Attack06_2Func",
    },
	
	-- 
    {
        ID      = "ATTACK06_R",
        Motion  = "vairne_attack06_B_01.frm",
        Func    = "vairne_Attack06_Func",
    },
	
	-- 
    {
        ID      = "ATTACK06_2_R",
        Motion  = "vairne_attack06_B_02.frm",
        Func    = "vairne_Attack06_2Func",
    },
	
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "vairne_Jump_Up.frm",
        Func    = "vairne_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "vairne_Jump_Down.frm",
        Func    = "vairne_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "vairne_Jump_Landing.frm",
        Func    = "vairne_ToWait",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "vairne_Damage.frm",
        Func    = "vairne_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "vairne_Die.frm",
        Func    = "vairne_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
}

CallBack =
{
    Land    = "Onvairne_Land",
    Die     = "Onvairne_Die",
    Damage  = "Onvairne_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initvairne( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_MIDDLE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_MIDDLE" )

    pMonster:AddParticle( "Nemo_Field_Boom_01", 0.0, 0.29 )
    pMonster:AddParticle( "Nemo_Field_Boom_02", 0.0, 0.29 )
    pMonster:AddParticle( "Nemo_Field_Boom_03", 0.0, 0.29 )
    pMonster:AddParticle( "Nemo_Field_Boom_05", 0.0, 0.29 )
    pMonster:AddParticle( "Nemo_Field_Boom_06", 0.0, 0.29 )
    pMonster:AddParticle( "Nemo_Field_Boom_09", 0.0, 0.29 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.29 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function vairne_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:TurnToTarget()
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function vairne_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 걷기 상태
function vairne_runFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽기 착지
function vairne_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(984007)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function vairne_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function vairne_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		
    elseif( iFrame == 15 ) then
		pMonster:TurnToTarget()
        --pMonster:AddTraceParticleToBone( "Vairne_Shot_01", 1.0, 41, 8, 8, 0.03, 0.05 )
        pMonster:AddTraceParticleToBone( "Vairne_Shot_02", 1.0, 41, 8, 8, 0.0, 0.05 )
        pMonster:AddTraceParticleToBone( "Vairne_Shot_03", 1.0, 41, 8, 8, 0.0, 0.05 )
        pMonster:AddTraceParticleToBone( "Vairne_Shot_04", 1.0, 41, 8, 8, 0.0, 0.05 )
		
	elseif ( iFrame == 52 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.25 ) -- 타겟으로의 각도를 계산
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK1, 0.0, 0.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK1, 0.0, 0.0, false, -angle )
		end
		pMonster:AddTraceParticleToBone( "Dark_Storm_Assasin_Hit_02", 1.0, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticleToBone( "Dark_Storm_Assasin_Hit_03", 1.0, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticleToBone( "Dark_Storm_Assasin_Hit_04", 1.0, 41, 8, 8, 0.03, 0.03 )
        
		pMonster:AddParticle( "Dark_Storm_Assasin_Hit_02", 0.15, 0.4 )
        pMonster:AddParticle( "Dark_Storm_Assasin_Hit_03", 0.15, 0.4 )
        pMonster:AddParticle( "Dark_Storm_Assasin_Hit_04", 0.15, 0.4 )
	    pMonster:PlaySound(984008)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function vairne_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 35 ) then 
	    pMonster:AddParticleNoDirection( "Spider_Machine_Boom_05", 0.0, 0.3 )
	    pMonster:AddParticleNoDirection( "Vairne_Spin_Before", 0.0, 0.13 )
	    pMonster:AddParticleNoDirection( "Vulcanus_Crash_04", 0.0, 0.18 )
    elseif( iFrame == 40 ) then 
	    pMonster:PlaySound(984009)
	elseif( iFrame == 55 ) then
		pMonster:AddDamage(DT_DEBRIS_VAIRNE_ATK2_1)
		pMonster:AddDamage(DT_DEBRIS_VAIRNE_ATK2_2)
		pMonster:AddParticleNoDirection( "Vairne_Tor_01", 0.0, 0.65 )
		pMonster:AddParticleNoDirection( "Vairne_Tor_02", 0.0, 0.65 )
		pMonster:AddParticleNoDirection( "Vairne_Tor_03", 0.0, 0.65 )
		pMonster:AddParticleNoDirection( "Vairne_Tor_04", 0.0, 0.65 )
		pMonster:AddParticleNoDirection( "Vairne_Tor_05", 0.0, 0.65 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function vairne_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 5 ) then
	    pMonster:PlaySound(984010)
	    pMonster:AddParticle( "Vairne_FS_01", 0.0, 0.45 )
	    pMonster:AddParticle( "Vairne_FS_02", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_FS_03", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_FS_04", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_FS_05", 0.0, 0.45 )
	    pMonster:AddParticle( "Vairne_Spark_01", 0.0, 0.45 )
	    pMonster:AddParticle( "Vairne_Spark_02", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_Spark_03", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_Spark_04", 0.0, 0.5 )
	    pMonster:AddParticle( "Vairne_Spark_05", 0.0, 0.45 )
	elseif( iFrame == 49 ) then 
	    local iDir = 0
	    if( pMonster:GetIsRight() == true ) then
	        iDir = 1
	    else
	        iDir = -1
	    end
	    
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, 0.25, 0.22, false, iDir * 0.85 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, 0.07, 0.28, false, iDir * 1.2 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.1, 0.36, false, iDir * 1.55 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.27, 0.3, false, iDir * 1.95 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.45, 0.22, false, iDir * 2.35 )
	    
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.32, 0.38 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.32, 0.38 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.32, 0.38 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.15, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.15, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.15, 0.5 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.0, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.0, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.0, 0.5 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", -0.15, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", -0.15, 0.5 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", -0.15, 0.5 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", -0.32, 0.38 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", -0.32, 0.38 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", -0.32, 0.38 )
	
	    pMonster:PlaySound(984011)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  
function vairne_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 5 ) then
	    pMonster:PlaySound(984010)
	    pMonster:AddParticle( "Vairne_FS_01_U", 0.0, 0.39 )
	    pMonster:AddParticle( "Vairne_FS_02_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_FS_03_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_FS_04_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_FS_05_U", 0.0, 0.39 )
	    pMonster:AddParticle( "Vairne_Spark_01_U", 0.0, 0.39 )
	    pMonster:AddParticle( "Vairne_Spark_02_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_Spark_03_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_Spark_04_U", 0.0, 0.34 )
	    pMonster:AddParticle( "Vairne_Spark_05_U", 0.0, 0.39 )
	elseif( iFrame == 49 ) then 
	    local iDir = 0
	    if( pMonster:GetIsRight() == true ) then
	        iDir = 1
	    else
	        iDir = -1
	    end
	    
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, 0.25, 0.0, false, iDir * -1.0 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, 0.07, -0.03, false, iDir * - 1.3 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.1, -0.08, false, iDir * -1.55 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.27, -0.03, false, iDir * -1.85 )
	    pMonster:AddDamageWithLocateAngle( DT_DEBRIS_VAIRNE_ATK3, -0.45, 0.0, false, iDir * -2.2 )
	    
      	pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.32, 0.24 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.32, 0.24 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.32, 0.24 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.15, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.15, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.15, 0.12 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", 0.0, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", 0.0, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", 0.0, 0.12 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", -0.15, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", -0.15, 0.12 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", -0.15, 0.12 )
	   
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_02", -0.32, 0.24 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_03", -0.32, 0.24 )
	    pMonster:AddParticle( "Jin01_SP1-3_Finish_04", -0.32, 0.24 )

	    pMonster:PlaySound(984011)  		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  
function vairne_Attack05_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:AddTraceParticleToBone( "Vairne_DHand_01", 1.0, 41, 8, 8, 0.03, 0.0 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_02", 0.05, 41, 8, 8, 0.03, 0.0 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_03", 0.05, 41, 8, 8, 0.03, 0.0 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_04", 0.05, 41, 8, 8, 0.03, 0.0 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_05", 1.0, 41, 8, 8, 0.1, -0.15 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_06", 1.0, 41, 8, 8, 0.1, -0.15 )
        pMonster:AddTraceParticleToBone( "Vairne_DHand_07", 0.05, 41, 8, 8, 0.03, 0.0 )
	elseif( iFrame == 55 ) then
		pMonster:AddDamage(DT_DEBRIS_VAIRNE_ATK5_RH)
	    if( pMonster:GetIsRight() ) then
	        pMonster:AddParticleNoDirection( "Vairne_Scratch", 0.0, 0.02 )
	    else 
	        pMonster:AddParticleNoDirection( "Vairne_Scratch_R", 0.0, 0.02 )
	    end
		pMonster:PlaySound(984025)
	elseif( iFrame == 157 ) then
        pMonster:AddTraceParticle( "Selion_Boom_01", 0.05, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticle( "Selion_Boom_02", 0.05, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticle( "Selion_Boom_04", 0.05, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticle( "Selion_Boom_05", 0.05, 41, 8, 8, 0.03, 0.03 )
        --pMonster:AddTraceParticle( "Demoncore_Boom_02", 0.05, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticle( "Demoncore_Boom_03", 0.05, 41, 8, 8, 0.03, 0.03 )
        pMonster:AddTraceParticle( "Demoncore_Boom_04", 0.05, 41, 8, 8, 0.03, 0.03 )
	elseif( iFrame == pMonster:GetLastFrame() -10 ) then
		pMonster:PlaySound(984012)
	elseif( iFrame == pMonster:GetLastFrame() -1 ) then
		pMonster:AddDamage(DT_DEBRIS_VAIRNE_ATK5_RH)
		pMonster:AddDamage(DT_DEBRIS_VAIRNE_ATK5_LH)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "ATTACK05_2" )
    end
end

function vairne_Attack05_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:AddParticle( "Vairne_DHand_Under_01", 0.0, 0.17 )
		--pMonster:AddParticle( "Vairne_DHand_Under_02", 0.0, 0.17 )
		pMonster:AddParticle( "Vairne_DHand_Under_03", 0.0, 0.17 )
		
		pMonster:AddTraceParticleToBone( "Vairne_DHand_01_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_02_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_03_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_04_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_05_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_06_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_07_U", 1.0, 41, 8, 8, 0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_01_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_02_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_03_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_04_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_05_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_06_U", 1.0, 25, 8, 8, -0.05, 0.03 )
		pMonster:AddTraceParticleToBone( "Vairne_DHand_07_U", 1.0, 25, 8, 8, -0.05, 0.03 )
  
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

function vairne_Attack06_Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )   
	elseif( iFrame == 2 ) then
	    pMonster:AddTraceParticleToBone( "Dark_Templar_Soul_Drain_Boom_02", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Butaros_Recall06", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Vairne_Back_01", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Vairne_Back_02", 1.0, 4, 8, 8, 0.0, 0.03 )
		pMonster:PlaySound(984013)
	elseif( iFrame == 30 ) then
		pMonster:AddDamage( DT_DEBRIS_VAIRNE_ATK6 )
	elseif( iFrame == 69 ) then
	    --pMonster:AddTraceParticleToBone( "Iblis_Teleport_01", 1.0, 4, 8, 8, 0.0, 0.03 )
	    --pMonster:AddTraceParticleToBone( "Iblis_Teleport_02", 1.0, 4, 8, 8, 0.0, 0.03 )
	    --pMonster:AddTraceParticleToBone( "Iblis_Teleport_03", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Dark_Templar_Soul_Drain_Absorb_02", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Dark_Templar_Soul_Drain_Boom_02", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Dark_Templar_Soul_Drain_Boom_03", 1.0, 4, 8, 8, 0.0, 0.03 )
	    pMonster:AddTraceParticleToBone( "Thanatos_2nd_Vampire_Boom_02", 1.0, 4, 8, 8, 0.0, 0.03 )
	
	elseif( iFrame == 85 ) then
		pMonster:SetX( pMonster:GetTargetX() )
		pMonster:SetY( 2.4 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetFly( true )
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( pMonster:GetIsRight() ) then 
            pMonster:SetPushCheck( true )
            pMonster:SetState( "ATTACK06_2_R" )
        else
            pMonster:SetPushCheck( true )
            pMonster:SetState( "ATTACK06_2_L" )
        end
    end
end

function vairne_Attack06_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 1 ) then 
        pMonster:SetCountValue( 0 )
    end
    
    if( iFrame >= 1 and iFrame <= 160 ) then    
        if( pMonster:GetX() - pMonster:GetTargetX() > 0.01 ) then 
            pMonster:SetSpeedX( -0.015 )
        elseif( pMonster:GetX() - pMonster:GetTargetX() < -0.01 ) then
            pMonster:SetSpeedX( 0.015 )
        else
            pMonster:SetSpeedX( 0.0 )
        end
        
        if( iFrame >= 1 and ( math.mod(iFrame, 10 ) == 3 ) and iFrame <= 185 ) then
                pMonster:AddCountValue( 1 )
                if( math.mod( pMonster:GetCountValue(), 2 ) == 0 ) then 
                    pMonster:AddDamage( DT_DEBRIS_VAIRNE_ATK6_L )
                else
                    pMonster:AddDamage( DT_DEBRIS_VAIRNE_ATK6_R )
                end
            
                pMonster:AddParticle( "Selion_Boom_02", 0.0, 0.18 )
                pMonster:AddParticle( "Selion_Boom_03", 0.0, 0.18 )
                pMonster:AddParticle( "Selion_Boom_04", 0.0, 0.18 )
                --pMonster:AddParticle( "Selion_Boom_06", 0.0, 0.18 )
                pMonster:PlaySound(984014) 
        end
    end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 185 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:TurnToTarget()
		pMonster:SetFly( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
		pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function vairne_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function vairne_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function vairne_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function vairne_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -3400, 1600, 3400, -1600 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function vairne_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 510, 800, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function vairne_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function vairne_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end
end

function vairne_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.75 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function vairne_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function vairne_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function vairne_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK02" )
			pMonster:ResetDelay()
		end
	end
end

function vairne_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 300, 300, 100 ) == true or pMonster:CheckTargetInRange( 0, -500, 800, 500, 300 ) == true ) then
	    if( pMonster:GetIsRight() ) then 
		    pMonster:SetState( "ATTACK03_R" )
		    pMonster:ResetDelay()
		else
		    pMonster:SetState( "ATTACK03_L" )
		    pMonster:ResetDelay()
		end
	end
end

function vairne_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, -100, 300, -300 ) == true or pMonster:CheckTargetInRange( 0, -500, -300, 500, -800 ) == true ) then
	    if( pMonster:GetIsRight() ) then 
		    pMonster:SetState( "ATTACK04_R" )
		    pMonster:ResetDelay()
		else
		    pMonster:SetState( "ATTACK04_L" )
		    pMonster:ResetDelay()
		end
	end
end

function vairne_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 66, -66, 80, 66, -100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function vairne_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
	        if( pMonster:GetIsRight() ) then 
			    pMonster:SetState( "ATTACK06_R" )
			else
			    pMonster:SetState( "ATTACK06_L" )
			end
			pMonster:ResetDelay()
		end
	end
end

function vairne_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 1200, 150, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		vairne_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function vairne_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -100, 200, -1200 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onvairne_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )    
    end
end

function Onvairne_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Onvairne_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if( pMonster:GetHP() <= (pMonster:GetMaxHP() * 0.25) ) then
			if( pMonster:FloatRand() < 0.1 ) then
		        if( pMonster:GetIsRight() ) then 
				    pMonster:SetState( "ATTACK06_R" )
				else
				    pMonster:SetState( "ATTACK06_L" )
				end
			end
		elseif( pMonster:GetHP() <= (pMonster:GetMaxHP() * 0.5) ) then
			if( pMonster:FloatRand() < 0.05 ) then
		        if( pMonster:GetIsRight() ) then 
				    pMonster:SetState( "ATTACK06_R" )
				else
				    pMonster:SetState( "ATTACK06_L" )
				end
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function vairne_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	
	if (fTargetY - fMonY == 0.0) then
		fTargetY = fMonY + 0.01
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function vairne_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.036 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018 )		
		end
	end
end
