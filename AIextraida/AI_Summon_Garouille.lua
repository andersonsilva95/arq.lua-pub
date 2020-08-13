-- AI_Summon_Garouille.lua

ActionList =
{	
    -- 등장
    {
        ID      = "INIT",
        Motion  = "Garouille_3138.frm",
        Func    = "Summon_Gargoyle_InitFunc",
    },

    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Summon_Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Summon_Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Summon_Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 41,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            -- 발차기
            {
                AICheckFrame        = 10,--20,
                AIFunc              = "Summon_Gargoyle_Check_Attack01",
                DelayFrame          = 20,--100,
            },

            -- 돌진
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_Attack02",
                DelayFrame          = 20,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Attack03",
                DelayFrame          = 30,
            },
            -- 화염 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack04",
                DelayFrame          = 30,
            },
            -- 아이스 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack05",
                DelayFrame          = 30,
            },

            -- 엄마와의 거리검사
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Mother",
                DelayFrame          = 30,
            },

        },
    },

    -- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Summon_Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Summon_Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 아래로이동 좌
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 20,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownRight",
                DelayFrame          = 20,
            },

            
             -- 발차기
            {
                AICheckFrame        = 10,--20,
                AIFunc              = "Summon_Gargoyle_Check_Attack01",
                DelayFrame          = 20,--100,
            },

            -- 돌진
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_Attack02",
                DelayFrame          = 20,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Attack03",
                DelayFrame          = 30,
            },
            -- 화염 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack04",
                DelayFrame          = 30,
            },
            -- 아이스 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack05",
                DelayFrame          = 30,
            },
        }
    },
    
    -- 아래로이동 좌
    {
        ID      = "MOVE_DOWN_LEFT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_MoveDownLeftFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Summon_Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Summon_Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Summon_Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },

            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            -- 발차기
            {
                AICheckFrame        = 10,--20,
                AIFunc              = "Summon_Gargoyle_Check_Attack01",
                DelayFrame          = 20,--100,
            },

            -- 돌진
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_Attack02",
                DelayFrame          = 20,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Attack03",
                DelayFrame          = 30,
            },
            -- 화염 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack04",
                DelayFrame          = 30,
            },
            -- 아이스 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack05",
                DelayFrame          = 30,
            },
        }
    },
    
     -- 아래로이동 우
    {
        ID      = "MOVE_DOWN_RIGHT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_MoveDownRightFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- 타겟지움
            {
                AICheckFrame        = 165,
                AIFunc              = "Summon_Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 22,
                AIFunc              = "Summon_Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- 위로이동
            {
                AICheckFrame        = 30,
                AIFunc              = "Summon_Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 41,
                AIFunc              = "Summon_Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },

            -- 발차기
            {
                AICheckFrame        = 10,--20,
                AIFunc              = "Summon_Gargoyle_Check_Attack01",
                DelayFrame          = 20,--100,
            },

            -- 돌진
            {
                AICheckFrame        = 15,
                AIFunc              = "Summon_Gargoyle_Check_Attack02",
                DelayFrame          = 20,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyle_Check_Attack03",
                DelayFrame          = 30,
            },
            -- 화염 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack04",
                DelayFrame          = 30,
            },
            -- 아이스 브레스
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Gargoyleg_Check_Attack05",
                DelayFrame          = 30,
            },
        }
    },

     -- 엄마에게로 이동
    {
        ID      = "MOVE_MOTHER",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_MoveMotherFunc",

        Trigger =
        {
            -- 이동멈춤 검사
            {
                AICheckFrame        = 1,
                AIFunc              = "Summon_Gargoyle_Check_MoveMother_Stop",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 가만히있기
    {
        ID      = "IDLE",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_IdleFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "Summon_Gargoyle_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Gargoyle_Attack01.frm",
        Func    = "Summon_Gargoyle_Attack01Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK02",
        Motion  = "Gargoyle_Attack02.frm",
        Func    = "Summon_Gargoyle_Attack02Func",
    },
    
    -- 석화
    {
        ID      = "ATTACK03",
        Motion  = "Gargoyle_Attack03.frm",
        Func    = "Summon_Gargoyle_Attack03Func",
    },
    
    -- 화염
    {
        ID      = "ATTACK04",
        Motion  = "Gargoyle_Attack03.frm",
        Func    = "Summon_Gargoyleg_Attack04Func",
    },
    
    -- 얼음
    {
        ID      = "ATTACK05",
        Motion  = "Gargoyle_Attack03.frm",
        Func    = "Summon_Gargoyleg_Attack05Func",
    },

    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Gargoyle_damage.frm",
        Func    = "Summon_Gargoyle_DamageFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Gargoyle_die01.frm",
        Func    = "Summon_Gargoyle_DieFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Gargoyle_Die02.frm",
        Func    = "Summon_Gargoyle_DieLandingFunc",
    },
    
    -- 석화 
    {
        ID      = "STONETOWAIT",
        Motion  = "Gargoyle_Change_wait.frm",
        Func    = "Summon_Gargoyle_StoneToWaitFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Summon_Gargoyle_StunFunc",
    },
}

CallBack =
{
    Land    = "Summon_OnGargoyle_Land",
    Die     = "Summon_OnGargoyle_Die",
    Damage  = "Summon_OnGargoyle_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGarouille( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:SetFly( true )
    pMonster:SetCountValue( pMonster:GetHP() - 700 )
    pMonster:SetState( "INIT" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 등장 상태
function Summon_Gargoyle_InitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= (pMonster:GetLastFrame() - 1) ) then
        pMonster:SetY( pMonster:GetY() + 0.38 )
        pMonster:SetState( "WAIT" )
    end
end

-- 대기 상태
function Summon_Gargoyle_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 피격 상태
function Summon_Gargoyle_StunFunc( iMonsterIndex, iFrame )
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
function Summon_Gargoyle_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

	if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV1 ) ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetSpeedY( 0.013 )	
	elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV2 ) ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetSpeedY( 0.014 )	
	else
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetSpeedY( 0.012 )	
	end

	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- 아래로날기 좌 상태
function Summon_Gargoyle_MoveDownLeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

	if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV1 ) ) then
		pMonster:SetSpeedX( -0.013 )
		pMonster:SetSpeedY( -0.004 )
	elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV2 ) ) then
		pMonster:SetSpeedX( -0.014 )
		pMonster:SetSpeedY( -0.004 )
	else
		pMonster:SetSpeedX( -0.012 )
		pMonster:SetSpeedY( -0.004 )
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_LEFT" )
    end
end

-- 아래로날기 우 상태
function Summon_Gargoyle_MoveDownRightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

	if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV1 ) ) then
		pMonster:SetSpeedX( 0.013 )
		pMonster:SetSpeedY( -0.004 )
	elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPEED_SPECIAL_LV2 ) ) then
		pMonster:SetSpeedX( 0.014 )
		pMonster:SetSpeedY( -0.004 )
	else
		pMonster:SetSpeedX( 0.012 )
		pMonster:SetSpeedY( -0.004 )
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
    end
end

-- 엄마에게로 이동 상태(나는 몬스터가 아닐때는 점프를 시켜줘야한다.)
function Summon_Gargoyle_MoveMotherFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local Pos = pMonster:TurnToMother()

    pMonster:SetFly( true )
    pMonster:SetSpeedX( Pos.x * 0.012 )
    pMonster:SetSpeedY( Pos.y * 0.004 )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_MOTHER" )
    end
end

-- 가만히있기 상태
function Summon_Gargoyle_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- 죽기상태
function Summon_Gargoyle_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function Summon_Gargoyle_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		--pMonster:PlaySound( 986035 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Summon_Gargoyle_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Summon_Gargoyle_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then

        --스킬체크(가고올리버전별)
		if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPECIAL_LV1 ) ) then
			pMonster:AddDamage(DT_SUMMON_GARGOYLE_KICK_ATK)
		elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SPECIAL_LV2 ) ) then
			pMonster:AddDamage(DT_SUMMON_GARGOYLE_KICK_ATK_LV2)
		end
		
		pMonster:PlaySound(995038)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  깃털공격 02 상태
function Summon_Gargoyle_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 58 ) then
    
        --스킬체크(가고올리버전별)
        --스킬체크(깃털공격버전별)    
		if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_A_SPECIAL_LV1 ) ) then
			pMonster:AddDamage(DT_SUMMON_GARGOYLE_DASHATK)
		elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_A_SPECIAL_LV2 ) ) then
			pMonster:AddDamage(DT_SUMMON_GARGOYLE_DASHATK_LV2)
		end
		
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(995039)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 석화 브레스
function Summon_Gargoyle_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )	
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then

        --스킬체크(가고올리버전별)
        --스킬체크(깃털공격버전별)   
				if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_SPECIAL_LV1 ) ) then
					pMonster:AddDamage(DT_SUMMON_GARGOYLE_STONEBREATH)
				elseif( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_SPECIAL_LV2 ) ) then
					pMonster:AddDamage(DT_SUMMON_GARGOYLE_STONEBREATH_LV2)
				end

    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995040)
		local posx = 0.15
		local posy = 0.12
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01" , posx, posy )
		else
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01_R" , -posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 화염 브레스
function Summon_Gargoyleg_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
    
        --스킬체크(가고올리버전별)
		pMonster:AddDamage(DT_SUMMON_GARGOYLE_FIREBREATH)

    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995040)
		local posx = 0.21
		local posy = 0.11		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_01" , posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_02" , posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_03" , posx, posy )
		else
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_01_R" , -posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_02_R" , -posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Fire_Breath_03_R" , -posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 얼음 브레스
function Summon_Gargoyleg_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then

        --스킬체크(가고올리버전별)    
		pMonster:AddDamage(DT_SUMMON_GARGOYLE_ICEBREATH)

    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995040)
		local posx = 0.21
		local posy = 0.11
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_01" , posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_02" , posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_03" , posx, posy )
		else
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_01_R" , -posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_02_R" , -posx, posy )
			pMonster:AddParticleNoDirection("Ley_Gar_Ice_Breath_03_R" , -posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Summon_Gargoyle_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -400, 200, 400, -250 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Summon_Gargoyle_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Summon_Gargoyle_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Summon_Gargoyle_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetY() < pMonster:GetTargetY() + 0.1 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Summon_Gargoyle_Check_MoveDownLeft( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.1 and pMonster:GetX() > pMonster:GetTargetX() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN_LEFT" )
        pMonster:ResetDelay()
    end
end

function Summon_Gargoyle_Check_MoveDownRight( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.1 and pMonster:GetX() < pMonster:GetTargetX() ) then
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

function Summon_Gargoyle_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 50, -50, 10, 50, -150 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Summon_Gargoyle_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )
    
    if( Player and (Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_A_SPECIAL_LV1 ) or Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_A_SPECIAL_LV2 ))) then
        if( pMonster:CheckTargetInRange( 350, -350, 100, 350, -150 ) == true ) then
	    	pMonster:SetSpeedX( 0.0 )
		    pMonster:SetSpeedY( 0.0 )
		    pMonster:SetState( "ATTACK02" )
		    pMonster:ResetDelay()
        end
    end
end

function Summon_Gargoyle_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )
    
    if( Player and (Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_SPECIAL_LV1 ) or Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_SPECIAL_LV2 ))) then
        if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		    pMonster:SetSpeedX( 0.0 )
		    pMonster:SetSpeedY( 0.0 )
		    pMonster:SetState( "ATTACK03" )
		    pMonster:ResetDelay()
        end
    end
end

function Summon_Gargoyleg_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )
    
    if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_FIRE_SPECIAL ) ) then
        if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		    pMonster:SetSpeedX( 0.0 )
		    pMonster:SetSpeedY( 0.0 )
		    pMonster:SetState( "ATTACK04" )
		    pMonster:ResetDelay()
        end
    end
end

function Summon_Gargoyleg_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )
    
    if( Player and Player:CheckSkill( SID_LEY01_GAROUILLE_SKILL_B_STONE_SPECIAL ) ) then
        if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		    pMonster:SetSpeedX( 0.0 )
		    pMonster:SetSpeedY( 0.0 )
		    pMonster:SetState( "ATTACK05" )
		    pMonster:ResetDelay()
        end
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

function Summon_Gargoyleg_Check_Mother( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckSummonMotherDist() == true ) then
		pMonster:SetState( "MOVE_MOTHER" )
		pMonster:ResetDelay()
    end
end

function Summon_Gargoyle_Check_MoveMother_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckSummonMotherDist() == false ) then
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Summon_OnGargoyle_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )
    elseif( pMonster:CheckState( "TOSTONE_R" ) == true or pMonster:CheckState( "TOSTONE_L" ) == true or pMonster:CheckState( "STONETOWAIT" ) == true ) then
		pMonster:SetSpeedY( 0.0 )
    end
end

function Summon_OnGargoyle_Die( iMonsterIndex )
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

function Summon_OnGargoyle_Damage( iMonsterIndex )
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
