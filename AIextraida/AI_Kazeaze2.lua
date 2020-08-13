-- AI_Kazeaze2.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Kazeaze2_Wait.frm",
        Func    = "Kazeaze2_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze2_Check_Targeting",
                DelayFrame          = 100,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Kazeaze2_Check_TurnToTarget",
                DelayFrame          = 60,
            },

			-- 걷기
            {
                AICheckFrame        = 110,
                AIFunc              = "Kazeaze2_Check_Walk",
                DelayFrame          = 110,
            },

            -- 레프트 팜
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze2_Check_Attack01",
                DelayFrame          = 175,
            },

            -- 라이트 팜 [50%]
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze2_Check_Attack02",
                DelayFrame          = 255,
            },

            -- 텐타클 스와이프
            {
                AICheckFrame        = 109,
                AIFunc              = "Kazeaze2_Check_Attack03",
                DelayFrame          = 337,
            },

            -- 어스퀘이크 [75%]
            {
                AICheckFrame        = 330,
                AIFunc              = "Kazeaze2_Check_Attack04",
                DelayFrame          = 330,
            },

            -- 다크니스 러쉬
            {
                AICheckFrame        = 10,
                AIFunc              = "Kazeaze2_Check_Attack05",
                DelayFrame          = 110,
            },

            -- 메가 플레어
            {
                AICheckFrame        = 109,
                AIFunc              = "Kazeaze2_Check_Attack06",
                DelayFrame          = 256,
            },

        },
    },
    
    -- 이동
    {
        ID              = "WALK",
        Motion          = "Kazeaze2_walk.frm",
        Func            = "Kazeaze2_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Kazeaze2_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 60,
                AIFunc              = "Kazeaze2_Check_Targeting",
                DelayFrame          = 60,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 40,
                AIFunc              = "Kazeaze2_Check_TurnToTarget",
                DelayFrame          = 40,
            },

			-- 멈추기
            {
                AICheckFrame        = 3,
                AIFunc              = "Kazeaze2_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },

    -- 어스퀘이크
    {
        ID      = "ATTACK01",
        Motion  = "Kazeaze2_Attack01.frm",
        Func    = "Kazeaze2_Attack01Func",
    },
    
    -- 촉수공격
    {
        ID      = "ATTACK02",
        Motion  = "Kazeaze2_Attack02.frm",
        Func    = "Kazeaze2_Attack02Func",
    },
    
    -- 다크니스볼
    {
        ID      = "ATTACK03",
        Motion  = "Kazeaze2_Attack03.frm",
        Func    = "Kazeaze2_Attack03Func",
    },
    
    -- 라이트닝스톰
    {
        ID      = "ATTACK04",
        Motion  = "Kazeaze2_Attack04.frm",
        Func    = "Kazeaze2_Attack04Func",
    },
    
    -- 어스퀘이크02
    {
        ID      = "ATTACK05",
        Motion  = "Kazeaze2_Attack05.frm",
        Func    = "Kazeaze2_Attack05Func",
    },
    
    -- 메가플레어
    {
        ID      = "ATTACK06",
        Motion  = "Kazeaze2_Attack06.frm",
        Func    = "Kazeaze2_Attack06Func",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Kazeaze2_Damage.frm",
        Func    = "Kazeaze2_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Kazeaze2_Die.frm",
        Func    = "Kazeaze2_DieFunc",
    },
}

CallBack =
{
    Land    = "OnKazeaze2_Land",
    Die     = "OnKazeaze2_Die",
    Damage  = "OnKazeaze2_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKazeaze2( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetY( 0.1 )
    
    --pMonster:AddTraceParticleToBone( "Kaz_Hand_L", 1.0, 24, 8, 8, 0.0, 0.05 )
	--pMonster:AddTraceParticleToBone( "Kaz_Hand_R", 1.0, 28, 8, 8, 0.0, 0.05 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Kazeaze2_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Kazeaze2_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Kazeaze2_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
        pMonster:PlaySound( "KazeSpeech3" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Kazeaze2_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  어스퀘이크 상태
function Kazeaze2_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE2_02 )
    elseif( iFrame == 65 ) then
		local posx = 0.75
		local posy = 0.27
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kaz_Hook_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Hook_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Hook_03_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("Kaz_Hook_01", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Hook_02", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Hook_03", posx, posy)
		end
		pMonster:PlaySound(987031)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 촉수공격 상태
function Kazeaze2_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE2_ATK2 )
		pMonster:PlaySound(987032)
	elseif( iFrame == 69 ) then
		local posx = 1.22
		local posy = 0.64
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kaz_Leftparm_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Leftparm_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Leftparm_03_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("Kaz_Leftparm_01", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Leftparm_02", posx, posy)
			pMonster:AddParticleNoDirection("Kaz_Leftparm_03", posx, posy)
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

-- 다크니스볼 상태
function Kazeaze2_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )

    elseif( iFrame == 66 ) then
		pMonster:AddDamage(DT_MONSTER_KAZEAZE2_ATK3)
		local posx = 0.0
		local posy = 0.35
		pMonster:AddParticleNoDirection("Kaz_Spin_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Spin_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Spin_03", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Spin_04", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Spin_05", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Spin_06", posx, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- 라이트닝볼트 상태
function Kazeaze2_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:StartText( "DANGER" )
        pMonster:SetSuperArmor( true )

    elseif( iFrame == 76 ) then
		pMonster:EarthQuake( 25, 0.046, 0.02 )
		local posx = 0.35
		local posy = 0.07
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Kaz_Earthquake_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_03", posx, posy)
		pMonster:PlaySound(987033)
	elseif( iFrame == 103 ) then
		pMonster:EarthQuake( 25, 0.046, 0.02 )
		local posx = 0.35
		local posy = 0.07
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Kaz_Earthquake_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_03", posx, posy)
		pMonster:PlaySound(987033)
	elseif( iFrame == 130 ) then
		pMonster:EarthQuake( 25, 0.051, 0.02 )
		local posx = 0.35
		local posy = 0.07
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Kaz_Earthquake_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_03", posx, posy)
		pMonster:PlaySound(987033)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
    end
end

-- 어스퀘이크02 상태
function Kazeaze2_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 80 or iFrame == 110 ) then
		local posx = 0.5
		local posy = 0.0
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection("Kaz_Run_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Run_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Run_03", posx, posy)
    end

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= 71 and iFrame <= 93 ) then
		if( iFrame == 71 ) then
			pMonster:AddDamage( DT_MONSTER_KAZEAZE2_RUN )
			pMonster:PlaySound(987034)
		end
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 3 )
    elseif( iFrame >= 99 and iFrame <= 111 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 3 )
	elseif( iFrame >= 112 and iFrame <= 115 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	elseif( iFrame == 133 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE2_ATK5 )
	elseif( iFrame == 136 ) then
		local posx = 0.88
		local posy = 0.25
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kaz_Bite_01", posx, posy)
		else
			pMonster:AddParticleNoDirection("Kaz_Bite_01_R", posx, posy)
		end
		pMonster:AddParticleNoDirection("Kaz_Bite_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Bite_03", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Bite_04", posx, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- 메가플레어 상태
function Kazeaze2_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 55 ) then
        --pMonster:AddDamage( DT_KAZEAZE_MEGAFLARE_READY )
        pMonster:PlaySound( 46 )

	elseif( iFrame == 64 ) then
		--[[
		local posx = 0.75
		local posy = 0.00

		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Kaz_Earthquake_01", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_02", posx, posy)
		pMonster:AddParticleNoDirection("Kaz_Earthquake_03", posx, posy)

		pMonster:EarthQuake( 25, 0.046, 0.02 )
		--]]
		pMonster:AddDamageToAlivePlayer( DT_MONSTER_KAZEAZE2_ATK6_PALM_1 )

    elseif( iFrame == 112 ) then
        --pMonster:AddDamage( DT_KAZEAZE_FIRE )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Kazeaze2_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        end    
        
        pMonster:SetState( "WAIT" )			        
	end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Kazeaze2_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -2000, 500, 2000, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Kazeaze2_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -440, 600, 440, -100 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Kazeaze2_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -440, 600, 440, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Kazeaze2_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 230, -230, 50, 230, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -300, 400, 300, -100 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 500, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 1200, -600, 280, 600, -100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Kazeaze2_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 950, -800, 400, 800, 50 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKazeaze2_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function OnKazeaze2_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )	
end

function OnKazeaze2_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )	

	pMonster:TurnToTarget() -- Temp!!
	if ( pMonster:FloatRand() < 0.04 and pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK06" ) == false and pMonster:CheckState( "ATTACK03" ) == false ) then
		pMonster:SetSuperArmor(true)
		pMonster:TurnToTarget()
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK03" )	
		else
			pMonster:SetState( "ATTACK04" )	
		end
	end

    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end
