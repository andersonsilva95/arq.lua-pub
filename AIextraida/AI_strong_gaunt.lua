-- AI_Gargoyle.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },


            -- 발차기
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- 돌진
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyleg_Check_Attack04",
                DelayFrame          = 222,
            },
            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyleg_Check_Attack05",
                DelayFrame          = 222,
            },
        },
    },

    -- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 아래로이동 좌
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            

            -- 발차기
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- 돌진
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
    -- 아래로이동 좌
    {
        ID      = "MOVE_DOWN_LEFT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveDownLeftFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },

            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            -- 발차기
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- 돌진
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
     -- 아래로이동 우
    {
        ID      = "MOVE_DOWN_RIGHT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveDownRightFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },


            -- 발차기
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- 돌진
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
    -- 가만히있기
    {
        ID      = "IDLE",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_IdleFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Gargoyle_Attack01.frm",
        Func    = "Gargoyle_Attack01Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK02",
        Motion  = "Gargoyle_Attack02.frm",
        Func    = "Gargoyle_Attack02Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK03",
        Motion  = "Gargoyle_Attack03.frm",
        Func    = "Gargoyle_Attack03Func",
    },
    
    {
        ID      = "ATTACK04",
        Motion  = "gunt_attack01.frm",
        Func    = "Gargoyleg_Attack04Func",
    },
    
    {
        ID      = "ATTACK05",
        Motion  = "gunt_attack02.frm",
        Func    = "Gargoyleg_Attack05Func",
    },
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Gargoyle_damage.frm",
        Func    = "Gargoyle_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Gargoyle_die01.frm",
        Func    = "Gargoyle_DieFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Gargoyle_Die02.frm",
        Func    = "Gargoyle_DieLandingFunc",
    },
    
    -- 서먼
    {
        ID      = "SUMMON",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_SummonFunc",
    },
    
    
    -- 석화 
    {
        ID      = "STONETOWAIT",
        Motion  = "Gargoyle_Change_wait.frm",
        Func    = "Gargoyle_StoneToWaitFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_StunFunc",
    },
}

CallBack =
{
    Land    = "OnGargoyle_Land",
    Die     = "OnGargoyle_Die",
    Damage  = "OnGargoyle_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGargoyleg( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    
    --pMonster:SetPushBoundBox( false )
    pMonster:SetFly( true )
    pMonster:SetCountValue( pMonster:GetHP() - 700 )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Gargoyle_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Gargoyle_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 3 ) then
		pMonster:AddParticle( "Pariot_Summon_01" )
		pMonster:AddParticle( "Pariot_Summon_02" )
		pMonster:AddParticle( "Pariot_Summon_03" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Gargoyle_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 위로날기 상태
function Gargoyle_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.012 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- 아래로날기 좌 상태
function Gargoyle_MoveDownLeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( -0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_LEFT" )
    end
end

-- 아래로날기 우 상태
function Gargoyle_MoveDownRightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( 0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
    end
end

-- 가만히있기 상태
function Gargoyle_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- 죽기상태
function Gargoyle_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function Gargoyle_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 986035 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Gargoyle_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Gargoyle_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:StartAttack( 9, PAR_DOWN, 0.3, 42, 42, 4)
		pMonster:PlaySound(995038)
	--elseif( iFrame == 52 ) then
	--	pMonster:EndAttack()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  깃털공격 02 상태
function Gargoyle_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 58 ) then
		pMonster:AddDamage(DT_GARGOYLE_DASHATK)
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(995039)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Gargoyle_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:AddDamage(DT_GARGOYLE_STONEBREATH)
    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995040)
		local posx = 0.24
		local posy = 0.27
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01" , posx, posy )
		else
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01_R" , -posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Gargoyleg_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 20, 20, 4)
	elseif( iFrame == 70 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 12, 12, 4)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function Gargoyleg_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 78 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 20, 20, 4)
	elseif( iFrame == 98 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 12, 12, 4)
	elseif( iFrame == 172 ) then
		pMonster:StartAttack( 9, PAR_DOWN, 0.3, 42, 42, 4)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Gargoyle_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -400, 200, 400, -250 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetY() < pMonster:GetTargetY() + 0.21 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_MoveDownLeft( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.21 and pMonster:GetX() > pMonster:GetTargetX() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN_LEFT" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_MoveDownRight( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.21 and pMonster:GetX() < pMonster:GetTargetX() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -200 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -350, 100, 350, -150 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Gargoyleg_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end


function Gargoyleg_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end
function Gargoyle_Check_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -400, 300, 400, -360 ) == true ) then
		if ( pMonster:FloatRand() < 0.75 ) then
			pMonster:SetState( "STONETOWAIT" )
	    	pMonster:ResetDelay()
		end
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGargoyle_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )
    elseif( pMonster:CheckState( "TOSTONE_R" ) == true or pMonster:CheckState( "TOSTONE_L" ) == true or pMonster:CheckState( "STONETOWAIT" ) == true ) then
		pMonster:SetSpeedY( 0.0 )
    end
end

function OnGargoyle_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DIE" )
	end	
end

function OnGargoyle_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact( 550 )
	
	--pMonster:SetSpeedX( (pMonster:GetSpeedX() )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 1.0) / 3.0 )
	--pMonster:SetSpeedX( 0.0 )
	--pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then	
	
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		
		if ( pMonster:FloatRand() < 0.2 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )	
		else
			pMonster:SetState( "ATTACK02" )	
		end
	end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end
