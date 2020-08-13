-- AI_Dio.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "2911.frm",
        Func    = "Dio_WaitFunc",
        
         Trigger =
        {
        
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "dio_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            {
                AICheckFrame        = 300,
                AIFunc              = "dio_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "dio_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- 달리기
            {
                AICheckFrame        = 50,
                AIFunc              = "dio_Check_Run",
                DelayFrame          = 50,
            },

            -- 점프업
            {
                AICheckFrame        = 100,
                AIFunc              = "dio_Check_JumpUp",
                DelayFrame          = 100,
            },        

            -- 점프다운
            {
                AICheckFrame        = 40,
                AIFunc              = "dio_Check_JumpDown",
                DelayFrame          = 30,
            },

             -- 온 러쉬 [75%]
            {
                AICheckFrame        = 250,
                AIFunc              = "dio_Check_Attack01",
                DelayFrame          = 400,
            },

            -- 기본 공격 [25%]
            {
                AICheckFrame        = 25,
                AIFunc              = "dio_Check_Attack02",
                DelayFrame          = 5,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "2912.frm",
        Func    = "Dio_WalkFunc",
        
        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "dio_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "dio_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "dio_Check_TurnToTarget",
                DelayFrame          = 15,
            },

            -- 점프업
            {
                AICheckFrame        = 50,
                AIFunc              = "dio_Check_JumpUp",
                DelayFrame          = 50,
            },       

            -- 점프다운
            {
                AICheckFrame        = 20,
                AIFunc              = "dio_Check_JumpDown",
                DelayFrame          = 15,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "dio_Check_Stop",
                DelayFrame          = 15,
            },
        }
        
    },
    
    -- 드라마 공격 
    {
        ID      = "ATTACK01",
        Motion  = "dio_drama.frm",
        Func    = "Dio_Attack01Func",
    },
    
    -- 근접공격 1
    {
        ID      = "ATTACK02",
        Motion  = "2955.frm",
        Func    = "Dio_Attack02Func",
    },
    
    
    -- 근접공격 2
    {
        ID      = "ATTACK03",
        Motion  = "2929.frm",
        Func    = "Dio_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "2917.frm",
        Func    = "dio_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "2918.frm",
        Func    = "dio_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "2918.frm",
        Func    = "dio_ToWait",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "011.frm",
        Func    = "Dio_DieFunc",
    },
}

CallBack =
{
    Land    = "OnDio_Land",
    Die     = "OnDio_Die",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDio( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetPlayerMonster()
    pMonster:SetInvincible( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Dio_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleExtraMesh("LANCE", false)
    pMonster:SetInvincible( true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Dio_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 드라마 공격 
function Dio_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:ToggleExtraMesh("LANCE", true)
    if( iFrame == 50 ) then 
	        pMonster:AddParticleNoDirection( "Chaos_Portal_HIT_04_dio", -0.18, 0.0 ) 
	        pMonster:AddParticleNoDirection( "Chaos_Portal_HIT_02_dio", -0.27, 0.13 ) 
    elseif( iFrame > 58 and iFrame < 114 ) then 
        if( (iFrame - 58) % 4 == 0 ) then 
            pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_01_R",5.0, -1, 8, 8, -0.2,0.1, true )
			pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_02_R",5.0, -1, 8, 8, -0.2,0.1, true )
			pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_03_R",5.0, -1, 8, 8, -0.2,0.1, true )
			pMonster:AddParticleNoDirection( "Chaos_Portal_HIT_01_dio",  -0.12, 0.13 )
			pMonster:AddParticleNoDirection( "Chaos_Portal_HIT_03_dio", -0.15, 0.13 )
			pMonster:AddDamage( DT_DEBRIS_DIO_ATK1 )
        end 
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState("WAIT")
        
    end
end

-- 근접공격 1
function Dio_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
 	LoopBegin = 58
	LoopEnd = 86
	 
    if( iFrame <= 1 ) then 
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 8 ) then 
        pMonster:ToggleExtraMesh("LANCE", true)
	elseif( iFrame == 50 ) then 
		pMonster:AddDamage( DT_DEBRIS_DIO_ATK1 )
    elseif( LoopBegin < iFrame and iFrame < LoopEnd ) then 
        if( ( iFrame - LoopBegin ) % 7 == 0 ) then
            if( pMonster:GetIsRight() ) then 
				pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_01",5.0, -1, 8, 8, 0.2,0.1, true )
			    pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_02",5.0, -1, 8, 8, 0.2,0.1, true )
			    pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_03",5.0, -1, 8, 8, 0.2,0.1, true )
			else
				pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_01_R",5.0, -1, 8, 8, -0.2,0.1, true )
			    pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_02_R",5.0, -1, 8, 8, -0.2,0.1, true )
			    pMonster:AddTraceParticleToBone( "Dio01_Lance_Rush_03_R",5.0, -1, 8, 8, -0.2,0.1, true )
		    end
		end    
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState("WAIT")
    end
end

-- 근접공격 2
function Dio_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
	elseif (iFrame == 7 )then		
		pMonster:AddDamage( DT_DEBRIS_DIO_ATK2 ) 		
	elseif (iFrame == 8 )then
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dio01_Combo_01", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dio01_Combo_02", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dio01_Combo_03", 0.0, 0.1 )
		else
			pMonster:AddParticleNoDirection( "Dio01_Combo_01_R", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dio01_Combo_02_R", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dio01_Combo_03_R", 0.0, 0.1 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState("WAIT")
    end
end

--  점프 상태
function dio_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() <= 0.0 ) then
	    pMonster:SetSuperArmor( true )
		--pMonster:SetFrameLock( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetState("JUMP_DOWN")
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function dio_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function dio_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function Dio_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
        pMonster:PlaySound(236)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
        
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function dio_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1200, 1200, 1200, -1200 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function dio_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 510, 800, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function dio_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function dio_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -150, 1200, 150, -1200 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function dio_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -150, 1200, 150, -1200 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function dio_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 360, -110, 50, 110, -100 ) == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function dio_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 80, -80, 50, 80, -100 ) == true and pMonster:FloatRand() < 0.25 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function dio_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 410, 200, 160 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		OnDio_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function dio_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -900 ) == true ) then
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
function OnDio_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnDio_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end

function OnDio_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	
	if (fTargetY - fMonY == 0.0) then
		fTargetY = fMonY + 0.01
	end
	
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 3.9)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.0)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.8))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end