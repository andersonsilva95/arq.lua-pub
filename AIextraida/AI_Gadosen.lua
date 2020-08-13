-- AI_Gadosen.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Gadosen_Wait.frm",
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
                AICheckFrame        = 80,
                AIFunc              = "Gadosen_Check_Attack04",
                DelayFrame          = 440,
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
                DelayFrame          = 550,
            },
            -- 이동
            {
                AICheckFrame        = 75,
                AIFunc              = "Gadosen_Check_Move",
                DelayFrame          = 150,
            },--
            -- 순간이동(타겟에게로)
            {
                AICheckFrame        = 110,
                AIFunc              = "Gadosen_Check_Warp",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID      = "MOVE",
        Motion  = "Gadosen_Move.frm",
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
            -- 순간이동(타겟에게로)
            {
                AICheckFrame        = 110,
                AIFunc              = "Gadosen_Check_Warp",
                DelayFrame          = 110,
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
        Motion  = "Gadosen_Attack01.frm",
        Func    = "Gadosen_Attack01Func",
    },

    -- 데스스워드
    {
        ID      = "ATTACK02",
        Motion  = "Gadosen_Attack02.frm",
        Func    = "Gadosen_Attack02Func",
    },

    -- 데스스피어
    {
        ID      = "ATTACK03",
        Motion  = "Gadosen_Attack03.frm",
        Func    = "Gadosen_Attack03Func",
    },

    -- 일섬
    {
        ID      = "ATTACK04",
        Motion  = "Gadosen_Attack04.frm",
        Func    = "Gadosen_Attack04Func",
    },

    -- 스톤커스
    {
        ID      = "ATTACK05",
        Motion  = "Gadosen_Attack05.frm",
        Func    = "Gadosen_Attack05Func",
    },

    -- 천지파열(메테오)
    {
        ID      = "ATTACK06",
        Motion  = "Gadosen_Attack06.frm",
        Func    = "Gadosen_Attack06Func",
    },

    -- 순간이동
    {
        ID      = "WARP",
        Motion  = "Gadosen_Warp.frm",
        Func    = "Gadosen_WarpFunc",

        Trigger =
        {
			-- 워프이동
			{
                AICheckFrame        = 1,
                AIFunc              = "Gadosen_Check_WarpMove",
                DelayFrame          = 0,
            },
        },
    },

    -- 순간이동 착지
    {
        ID      = "WARP_LANDING",
        Motion  = "Gadosen_Warp_Landing.frm",
        Func    = "Gadosen_WarpLandingFunc",

        Trigger =
        {
			 -- 근접공격
            {
                AICheckFrame        = 1,
                AIFunc              = "Gadosen_Check_WarpAttack",
                DelayFrame          = 0,
            },
        },

    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Gadosen_Damage_Up.frm",
        Func    = "Gadosen_DamageFunc",
    },

    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Gadosen_Damage_Down.frm",
        Func    = "Gadosen_DamageFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Gadosen_Die.frm",
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

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Gadosen_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1500, 1000, 1500, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

-- 이동 상태
function Gadosen_MoveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE" )
    end
end

--  근접공격01 상태
function Gadosen_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetFly( false )
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame >= 45 and iFrame < 50 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		if( iFrame == 47 ) then
			pMonster:AddDamage( DT_MONSTER_GADOSEN01_01 )
			pMonster:PlaySound(987028)
		end
	elseif( iFrame == 70 ) then
		pMonster:AddDamage( DT_MONSTER_GADOSEN01_02 )
		pMonster:PlaySound(987028)
	elseif( iFrame >= 76 and iFrame < 81 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  데스스워드공격
function Gadosen_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	 elseif( iFrame == 51 ) then
		pMonster:SkillReadyEffectNoStop( 150, 100, 150, 0.0 )
	elseif( iFrame >= 61 and iFrame < 71 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

		if( iFrame == 61 ) then
			pMonster:AddDamage( DT_MONSTER_GADOSEN02 )
		elseif( iFrame == 64 ) then
			pMonster:PlaySound(987028)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  데스스피어 상태
function Gadosen_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound( 149 )
	elseif( iFrame == 31 ) then
		pMonster:SkillReadyEffectNoStop( 100, 100, 100, 0.0 )
	elseif( iFrame >= 56 and iFrame < 71 ) then

		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_GADOSEN03, 0.4, 0.0 )
		end

		if( iFrame == 61 ) then

			pMonster:PlaySound( 43 )

			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "death spear 01", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", 0.4, 0.0 )
				pMonster:AddParticle( "death spear 04", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07", 0.4, 0.0 )
			else
				pMonster:AddParticleNoDirection( "death spear 01_R", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02_R", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", -0.4, 0.0 )
				pMonster:AddParticle( "death spear 04", 0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", -0.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07_R", -0.4, 0.0 )
			end
		end
	elseif( iFrame >= 71 and iFrame < 86 ) then

		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_GADOSEN03, 0.9, 0.0 )
		end

		if( iFrame == 76 ) then

			pMonster:PlaySound( 43 )

			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "death spear 01", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", 0.9, 0.0 )
				pMonster:AddParticle( "death spear 04", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07", 0.9, 0.0 )
			else
				pMonster:AddParticleNoDirection( "death spear 01_R", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02_R", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", -0.9, 0.0 )
				pMonster:AddParticle( "death spear 04", 0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", -0.9, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07_R", -0.9, 0.0 )
			end
		end
	elseif( iFrame >= 86 and iFrame < 101 ) then

		if( math.mod( iFrame, 2) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_GADOSEN03, 1.4, 0.0 )
		end
		if( iFrame == 91 ) then

			pMonster:PlaySound( 43 )

			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "death spear 01", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", 1.4, 0.0 )
				pMonster:AddParticle( "death spear 04", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07", 1.4, 0.0 )
			else
				pMonster:AddParticleNoDirection( "death spear 01_R", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 02_R", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 03", -1.4, 0.0 )
				pMonster:AddParticle( "death spear 04", 1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 05", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 06", -1.4, 0.0 )
				pMonster:AddParticleNoDirection( "death spear 07_R", -1.4, 0.0 )
			end
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  일섬 상태
function Gadosen_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound( 149 )
	elseif( iFrame == 41 ) then
		pMonster:SkillReadyEffectNoStop( 100, 100, 100, 0.0 )
	elseif( iFrame == 51 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 30.0 )
        pMonster:AddDamage( DT_MONSTER_GADOSEN04 )
        pMonster:PlaySound(987028)
	elseif( iFrame == 56 ) then
		pMonster:AddParticle( "gado_silhouette", 0.3, 0.5 )
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame == 58 ) then
		pMonster:AddParticle( "gado_silhouette", 0.3, 0.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  다크스톤커스 상태
function Gadosen_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 55 ) then
        pMonster:AddBlackHoleEffect()
    elseif( iFrame >= 56 and iFrame <= 100 ) then
        pMonster:PullPlayer(0.0,0.5)
		if( iFrame == 57 ) then
			pMonster:PlaySound( 147 )
			pMonster:PlaySound(987029)
		end
    elseif( iFrame == 101 ) then
		pMonster:AddDamageWithLocate( DT_DARK_STONECURSE, 0.2, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  메테오 상태
function Gadosen_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:PlaySound( 148 )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(987030)
	elseif( iFrame == 16 ) then
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,0.25, 0.95,true )
	elseif( iFrame == 26 ) then
	    pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,1.45, 1.59,true )
	elseif( iFrame == 36 ) then
	    pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,3.0, 0.62,true )
	elseif( iFrame == 46 ) then
	    pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,3.9, 1.2,true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end


-- 순간이동 상태
function Gadosen_WarpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 30 )
	elseif( iFrame == 21 ) then
		local posx = 0.0
		if( false == pMonster:GetIsRight() ) then
			posx = 0.0
		end
		pMonster:AddParticle( "gado_teleport01", posx, 0.5 )
		pMonster:AddParticle( "gado_teleport02", posx, 0.5 )
		pMonster:AddParticle( "gado_teleport03", posx, 0.5 )
	elseif( iFrame == 26 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WARP_LANDING" )
    end
end

--  순간이동 착지 상태
function Gadosen_WarpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 6 ) then
		pMonster:SetFly( true )
		local posx = -0.02
		if( false == pMonster:GetIsRight() ) then
			posx = -0.05			
		end
		pMonster:AddParticle( "gado_teleport2-01", posx, 0.5 )
		pMonster:AddParticle( "gado_teleport2-02", posx, 0.5 )
		pMonster:AddParticle( "gado_teleport2-03", posx, 0.5 )
    elseif( iFrame == 30 ) then
		pMonster:SetInvincible( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )   -- 가만있기
    end

	if( iFrame >= 21 ) then
		pMonster:SetFly( false )
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
	end
end

-- 죽는상태
function Gadosen_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(987027)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Gadosen_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Gadosen_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1800, 600, 1800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gadosen_Check_Move( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, -100 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE" )
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Gadosen_Check_Warp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetIsContact() == true and pMonster:CheckTargetInRange( 100, -400, 200, 400, -100 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetInvincible( true )
		pMonster:SetState( "WARP" )
		pMonster:ResetDelay()
    end
end

function Gadosen_Check_WarpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 30 ) then
		if( pMonster:GetTargetIsRight() == true ) then
			pMonster:SetX( pMonster:GetTargetX() - 0.2 )
		else
			pMonster:SetX( pMonster:GetTargetX() + 0.2 )
		end

		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
		pMonster:TurnToTarget()
        pMonster:SetSuperarmor( true )
		pMonster:ResetDelay()
    end
end

function Gadosen_Check_WarpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= 36 and pMonster:CheckTargetInRange( 150, -150, 150, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
    end
end

function Gadosen_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
    end
end

function Gadosen_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 400, -100, 300, 100, -50 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function Gadosen_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 250, -150, 300, 150, 0 ) == true or pMonster:CheckTargetInRange( 350, -150, 400, 150, 200 ) == true or pMonster:CheckTargetInRange( 450, -150, 550, 150, 350 ) == true or pMonster:CheckTargetInRange( 550, -150, 700, 150, 500 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Gadosen_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

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

	if( pMonster:CheckTargetInRange( 0, -700, 400, 700, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Gadosen_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

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

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnGadosen_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "DIE" )
end

function OnGadosen_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 0.66 )
    pMonster:SetSpeedY( 0.0 )

	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then
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
