-- AI_Ghost_Samural.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Ghost_Samural_Wait.frm",
        Func    = "Ghost_Samural_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Ghost_Samural_Check_Targeting",
                DelayFrame          = 40,
            },

             --Ÿ������
            {
            	AICheckFrame        = 200,
            	AIFunc              = "Ghost_Samural_Check_ReleaseTarget",
            	DelayFrame          = 100,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Ghost_Samural_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- �ȱ�
            {
                AICheckFrame        = 66,
                AIFunc              = "Ghost_Samural_Check_Walk",
                DelayFrame          = 33,
            },

            -- ������
            {
                AICheckFrame        = 51,
                AIFunc              = "Ghost_Samural_Check_JumpUp",
                DelayFrame          = 50,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 52,
                AIFunc              = "Ghost_Samural_Check_JumpDown",
                DelayFrame          = 50,
            },

			-- �繫���� ���̵�
            {
                AICheckFrame        = 30,
                AIFunc              = "Ghost_Samural_Check_Attack01",
                DelayFrame          = 200,
            },

            -- �繫���� ���Ǹ�
            {
                AICheckFrame        = 50,
                AIFunc              = "Ghost_Samural_Check_Attack02",
                DelayFrame          = 400,
            },

            -- ��Ʈ ������
            {
                AICheckFrame        = 25,
                AIFunc              = "Ghost_Samural_Check_Attack03",
                DelayFrame          = 300,
            },

		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Ghost_Samural_walk.frm",
        Func            = "Ghost_Samural_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ghost_Samural_MoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 20,
                AIFunc              = "Ghost_Samural_Check_Targeting",
                DelayFrame          = 40,
            },

			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "Ghost_Samural_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 31,
                AIFunc              = "Ghost_Samural_Check_JumpUp",
                DelayFrame          = 50,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 32,
                AIFunc              = "Ghost_Samural_Check_JumpDown",
                DelayFrame          = 40,
            },
            -- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Ghost_Samural_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Ghost_Samural_Attack01.frm",
        Func    = "Ghost_Samural_Attack01Func",
    },
    
    -- ��������2
    {
        ID      = "ATTACK02",
        Motion  = "Ghost_Samural_Attack02.frm",
        Func    = "Ghost_Samural_Attack02Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK03",
        Motion  = "Ghost_Samural_Attack03.frm",
        Func    = "Ghost_Samural_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Ghost_Samural_Jump_Up.frm",
        Func    = "Ghost_Samural_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Ghost_Samural_Jump_Down.frm",
        Func    = "Ghost_Samural_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Ghost_Samural_Jump_Landing.frm",
        Func    = "Ghost_Samural_ToWait",
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Ghost_Samural_Die.frm",
        Func    = "Ghost_Samural_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnGhost_Samural_Land",
    Die     = "OnGhost_Samural_Die",
    Damage  = "OnGhost_Samural_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGhost_Samural( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Ghost_Samural_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Ghost_Samural_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ױ� ����
function Ghost_Samural_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 ) -- 2ȣ��

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(988020)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Ghost_Samural_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Ghost_Samural_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 58 ) then
		pMonster:AddDamage(DT_GHOST_SAMURAL_ATK1_1)
		pMonster:PlaySound(988014)
    elseif( iFrame == 68 ) then
		pMonster:AddDamage(DT_GHOST_SAMURAL_ATK1_1)
		pMonster:PlaySound(988014)
    elseif( iFrame == 82 ) then
		pMonster:AddDamage(DT_GHOST_SAMURAL_ATK1_2)
		pMonster:PlaySound(988014)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function Ghost_Samural_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 80 ) then
		pMonster:SetPushCheck( false )
		pMonster:AddDamage(DT_GHOST_SAMURAL_ATK2)
		pMonster:AddDamage(DT_GHOST_SAMURAL_ATK2_R)
	elseif( iFrame == 83 ) then
		local posx = 0.0
		local posy = 0.3
		pMonster:AddParticleNoDirection( "Ghost_Samurai_Spirit_01", posx, posy, true )
		pMonster:AddParticleNoDirection( "Ghost_Samurai_Spirit_02", posx, posy, true )
		pMonster:AddParticleNoDirection( "Ghost_Samurai_Spirit_03", posx, posy, true )
		pMonster:AddParticleNoDirection( "Ghost_Samurai_Spirit_04", posx, posy, true )
		pMonster:AddParticleNoDirection( "Ghost_Samurai_Spirit_05", posx, posy, true )
		pMonster:PlaySound(988021)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  
function Ghost_Samural_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:AddDamageWithLocate(DT_GHOST_SAMURAL_ATK3, 1.0, 0.5)
	elseif( iFrame == 52 ) then
		local posx = 0.35
		local posy = 0.05
		if ( not pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Ghost_Samurai_Storm_01",posx,posy,true)
		pMonster:AddParticleNoDirection("Ghost_Samurai_Storm_02",posx,posy,true)
		pMonster:AddParticleNoDirection("Ghost_Samurai_Storm_03",posx,posy,true)
		pMonster:AddParticleNoDirection("Ghost_Samurai_Storm_04",posx,posy,true)
		pMonster:PlaySound(988022)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Ghost_Samural_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 8 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 8 ) then
		Ghost_Samural_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Ghost_Samural_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Ghost_Samural_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Ghost_Samural_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 360, 400, -300 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Ghost_Samural_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() and pMonster:CheckTargetInRange( 100, -600, 460, 600, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -250, 450, 250, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Ghost_Samural_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -250, 450, 250, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 80, 150, -80 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -250, 100, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 140, -90, 200, 90, -200 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 500, 200, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Ghost_Samural_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, -90, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnGhost_Samural_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnGhost_Samural_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end
	
	pMonster:SetState( "DIE_LANDING" )
end

function OnGhost_Samural_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			if( pMonster:CheckTargetInRange( 0, -250, 100, 250, -100 ) == true ) then
				pMonster:SetState( "ATTACK02" )
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

function Ghost_Samural_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Ghost_Samural_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.025 )
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )		
		end
	end
end